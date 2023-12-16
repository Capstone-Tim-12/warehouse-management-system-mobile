import 'dart:convert';
import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:http/http.dart' as http;

class PaymentServices {
  // static const String baseUrl =
  //     "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  String baseUrl = UrlCollection().urlProd;

  // Future<http.Res>
  Future<http.Response> getPaymentMethod(String token) async {
    final response =
        await http.get(Uri.parse('$baseUrl/payment/method'), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  Future<http.Response> getBankVAList(String token) async {
    final response =
        await http.get(Uri.parse('$baseUrl/payment/va/bank'), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    return response;
  }

  Future<http.Response> checkoutPayment(String token, int paymentMethodId,
      int instalmentId, String bankCode) async {
    final response = await http.post(Uri.parse('$baseUrl/payment/checkout'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "paymentMethodId": paymentMethodId,
          "instalmentId": instalmentId,
          "data": "{\"bankCode\":\"$bankCode\"}"
        }));

    return response;
  }
}
