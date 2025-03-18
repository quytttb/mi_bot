import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/home_provider.dart';
import '../../widgets/conversation_view.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/header.dart';
import '../../widgets/input_bar.dart';
import '../../widgets/new_chat_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);
    final messageController = TextEditingController();

    void sendMessage() {
      final userMessage = messageController.text;
      if (userMessage.isNotEmpty) {
        homeNotifier.sendMessage(userMessage);
        messageController.clear();
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            final isTablet = constraints.maxWidth >= 600;
            final paddingValue = isTablet ? 40.0 : 24.0;
            final containerWidth = isTablet ? 480.0 : constraints.maxWidth;

            return Scaffold(
              drawer: DrawerMenu(onNewChat: () => homeNotifier.startNewChat()),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(paddingValue),
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: containerWidth),
                      child: Column(
                        children: [
                          // Dùng Builder để wrap Header để tạo context mới là con của Scaffold
                          Builder(
                            builder: (context) {
                              return Header(
                                onMenuPressed: () => Scaffold.of(context).openDrawer(),
                              );
                            },
                          ),
                          Expanded(
                            child: homeState.isConversationStarted
                                ? ConversationView(messages: homeState.messages)
                                : NewChatView(
                                    onSuggestionTap: (suggestion) {
                                      messageController.text = suggestion;
                                      sendMessage();
                                    },
                                  ),
                          ),
                          InputBar(
                            controller: messageController,
                            onSend: sendMessage,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}