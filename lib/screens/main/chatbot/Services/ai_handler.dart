import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final _openAI = OpenAI.instance.build(
    token: '', // Replace with your API key
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );

  Future<String> getResponse(String message) async {
    try {
      final userMessage = Messages(
          role: Role.user,
          content:
              message); // Assuming Role.user is defined in the chat_gpt_sdk
      final request = ChatCompleteText(
        messages: [userMessage],
        maxToken: 200,
        model:
            GptTurbo0301ChatModel(), // Make sure this is correctly defined/ imported
      );

      final response = await _openAI.onChatCompletion(request: request);
      if (response != null && response.choices.isNotEmpty) {
        return response.choices[0].message!.content.trim();
      }

      return 'No response or empty choices';
    } catch (e, stackTrace) {
      // Log the error or print it for debugging purposes
      print('Error: $e');
      print('StackTrace: $stackTrace');

      return 'Bad response: $e'; // Return a message containing the error
    }
  }
}
