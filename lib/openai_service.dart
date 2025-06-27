import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = "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"; // <<< यहाँ अपना API Key डालें

  Future<String> getResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content": "You are Tony, a male AI assistant. Respond in 1-2 sentences."
            },
            {"role": "user", "content": prompt}
          ]
        }),
      );
      
      return jsonDecode(response.body)['choices'][0]['message']['content'];
    } catch (e) {
      return "Sorry sir, connection problem";
    }
  }
}