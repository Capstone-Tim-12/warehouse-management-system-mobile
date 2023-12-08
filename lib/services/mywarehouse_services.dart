import 'dart:convert';
import 'package:http/http.dart' as http;

class MyWarehouseServices {
  static const String baseUrl =
      "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  Future<http.Response> getSubmittedRent(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/warehouse/submitted'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }

  Future<http.Response> getRentedWarehouse(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/warehouse/rented?page=1&limit='),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }
}
