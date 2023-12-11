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

  //detail my warehouse

  Future<http.Response> getWarehouseInfo(String token, String warehouseId) async {
    final response = await http.get(
        Uri.parse('$baseUrl/warehouse/info/$warehouseId'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    return response;
  }

  Future<http.Response> getInstallmentList(
      String token, String transactionId) async {
    final response = await http.get(
        Uri.parse('$baseUrl/payment/instalment/$transactionId?page=1&limit=10'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    return response;
  }

  Future<http.Response> getTransactionIfo(
      String token, String transactionId) async {
    final response = await http.get(
        Uri.parse('$baseUrl/payment/transaction/$transactionId'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    return response;
  }
}
