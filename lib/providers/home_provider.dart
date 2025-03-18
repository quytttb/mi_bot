import 'package:flutter_riverpod/flutter_riverpod.dart';
          import '../models/chat_message.dart';
          import '../services/ai_service.dart';

          class HomeState {
            final bool isConversationStarted;
            final List<ChatMessage> messages;

            HomeState({
              this.isConversationStarted = false,
              this.messages = const [],
            });

            HomeState copyWith({
              bool? isConversationStarted,
              List<ChatMessage>? messages,
            }) {
              return HomeState(
                isConversationStarted: isConversationStarted ?? this.isConversationStarted,
                messages: messages ?? this.messages,
              );
            }
          }

          class HomeNotifier extends StateNotifier<HomeState> {
            final AIService _aiService;

            HomeNotifier(this._aiService) : super(HomeState()) {
              _aiService.initialize(onError: _showApiKeyError);
            }

            void _showApiKeyError() {
              // Handle API key error
            }

            void sendMessage(String userMessage) async {
              if (userMessage.isEmpty) return;

              state = state.copyWith(
                messages: [...state.messages, ChatMessage(text: userMessage, isUser: true)],
                isConversationStarted: true,
              );

              try {
                final response = await _aiService.sendMessage(userMessage);
                state = state.copyWith(
                  messages: [...state.messages, ChatMessage(text: response, isUser: false)],
                );
              } catch (e) {
                state = state.copyWith(
                  messages: [...state.messages, ChatMessage(text: "Sorry, I couldn't process that request.", isUser: false)],
                );
              }
            }

            void startNewChat() {
              state = HomeState();
            }
          }

          final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
            final aiService = AIService();
            return HomeNotifier(aiService);
          });