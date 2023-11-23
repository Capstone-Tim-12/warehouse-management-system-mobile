import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static final String baseUrl =
      "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  static Future<Map<String, dynamic>> logInUser(
      String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/user/login'), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to log in');
    }
  }

  
}
