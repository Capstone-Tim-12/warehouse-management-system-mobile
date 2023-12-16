import 'dart:convert';

import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  // static const String baseUrl =
  //     "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";
  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> addToFavorites(int warehouseId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('$baseUrl/warehouse/favorit'),
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'warehouseId': warehouseId,
      },)
    );
    return response;
  }

  Future<http.Response> getFavorites(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/warehouse/favorit'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> deleteFromFavorites(String warehouseId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.delete(
      Uri.parse('$baseUrl/warehouse/favorit/$warehouseId'),
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
      },
    );
    return response;
  }
}
