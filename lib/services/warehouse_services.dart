import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WarehouseServidces {
  // UrlCollection urls = UrlCollection();
  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> getWarehouseList(
      SearchWarehouse param, String page) async {
    final response = await http.get(Uri.parse(
            // '$baseUrl/warehouse/user/list?page=1&limit=10&search=${param.search}&maxPrice=${param.maxPrice}&minSize=${param.minSize}&maxSize=${param.maxSize}&minPrice=${param.minPrice}'
            "$baseUrl/warehouse/user/list?page=$page&limit=10&status=tersedia&search=${param.search}&maxPrice=${param.maxPrice}&minSize=${param.minSize}&maxSize=${param.maxSize}&minPrice=${param.minPrice}"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${param.token}',
        });

    return response;
  }

  Future<http.Response> getRecommendedWarehouse(
      SearchWarehouse param, String page) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl/warehouse/user/list?page=$page&limit=10&search=${param.search}&maxPrice=${param.maxPrice}&minSize=${param.minSize}&maxSize=${param.maxSize}&minPrice=${param.minPrice}&recomendation=true&status=tersedia'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${param.token}',
        });

    return response;
  }

  Future<http.Response> getHigestPriceWarehouse(
      SearchWarehouse param, String page) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl/warehouse/user/list?page=$page&limit=10&search=${param.search}&maxPrice=${param.maxPrice}&minSize=${param.minSize}&maxSize=${param.maxSize}&minPrice=${param.minPrice}&highestPrice=true&status=tersedia'),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': 'Bearer ${param.token}',
        });

    return response;
  }

  Future<http.Response> getLowerPriceWarehouse(
      SearchWarehouse param, String page) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl/warehouse/user/list?page=$page&limit=10&search=${param.search}&maxPrice=${param.maxPrice}&minSize=${param.minSize}&maxSize=${param.maxSize}&minPrice=${param.minPrice}&lowerPrice=true&status=tersedia'),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': 'Bearer ${param.token}',
        });

    return response;
  }

  Future<http.Response> getWarehousebyId(String param, String token) async {
    final response =
        await http.get(Uri.parse('$baseUrl/warehouse/detail/$param'), headers: {
      'Authorization': 'Bearer ${token}',
    });

    return response;
  }
}
