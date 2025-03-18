import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  late GenerativeModel _model;
  late ChatSession _chat;
  bool _isInitialized = false;

  void initialize({Function? onError}) {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null) {
      if (onError != null) onError();
      return;
    }

    _model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
    );

    _chat = _model.startChat(history: []);
    _isInitialized = true;
  }

  Future<String> sendMessage(String message) async {
    if (!_isInitialized) {
      throw Exception('AI Service not initialized');
    }

    final content = Content.text(message);
    final response = await _chat.sendMessage(content);

    return response.text ?? "Sorry, I couldn't generate a response.";
  }
}