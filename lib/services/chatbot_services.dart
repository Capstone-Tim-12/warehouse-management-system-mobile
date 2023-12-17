import 'dart:convert';

import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:capstone_wms/screens/main/chatbot/model/openai_model.dart';
import 'package:http/http.dart' as http;

class ChatbotServices {

  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> sendMessage(String token, String message) async {
    final response = await http.post(Uri.parse('$baseUrl/user/chatbot'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'text': message}));

    return response;
  }

  Future<http.Response> getUserId(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }
}
