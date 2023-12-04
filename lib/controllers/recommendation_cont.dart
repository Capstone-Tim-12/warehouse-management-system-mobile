import 'dart:convert';

import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:capstone_wms/services/warehouse_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecommendationController extends GetxController {
  WarehouseServidces warehoouseServices = WarehouseServidces();
  RxList<dynamic> recommededData = <dynamic>[].obs;
  RxBool isRecommendationLoading = false.obs;

  Future<void> getRecommendation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isRecommendationLoading.value = true;
    recommededData.clear();

    try {
      SearchWarehouse recomendedWarehouse = SearchWarehouse(
          token: prefs.getString('token')!,
          search: '',
          maxPrice: '',
          minPrice: '',
          minSize: '',
          maxSize: '');

      final response =
          await warehoouseServices.getRecommendedWarehouse(recomendedWarehouse);

      Map<String, dynamic> responseData = jsonDecode(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          recommededData.value = [];
        } else {
          List<dynamic> warehouseList = responseData['data'];
          recommededData.addAll(warehouseList);
        }
      } else {
        Get.snackbar(
          response.statusCode.toString(),
          '${responseData['message']}',
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isRecommendationLoading.value = false;
    }
  }
}
