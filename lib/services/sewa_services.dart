import 'dart:convert';

import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:capstone_wms/models/pengajuan_model.dart';
import 'package:http/http.dart' as http;

class ApplicationServices {
  // static const String baseUrl =
  //     "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> rentApplication(RentApplicationModel param) async {
    final response =
        await http.post(Uri.parse('$baseUrl/payment/user/submission'),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer ${param.token}',
            },
            body: jsonEncode({
              "warehouseId": param.warehouseId,
              "paymentSchemeId": param.paymentSchemeId,
              "duration": param.duration,
              "dateEntry": param.dateEntry
            }));

    return response;
  }

  Future<http.Response> getUserInfo(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/info'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }

  Future<http.Response> getWarehouseInfo(String token, int warehouseId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/warehouse/info/$warehouseId'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }
}
