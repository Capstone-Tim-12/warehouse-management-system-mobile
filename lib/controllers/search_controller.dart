import 'dart:convert';

import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:capstone_wms/screens/main/dashboard/search_screen.dart';
import 'package:capstone_wms/services/warehouse_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FindController extends GetxController {
  WarehouseServidces warehoouseServices = WarehouseServidces();

  RxString searchString = ''.obs;
  RxString minPrice = ''.obs;
  RxString maxPrice = ''.obs;
  RxString maxSize = ''.obs;
  RxString minSize = ''.obs;
  RxBool isLoading = false.obs;
  // RxList<dynamic>? warehouseData;
  RxList<dynamic> warehouseData = <dynamic>[].obs;

  void onSearchSubmitted(String param) {
    searchString.value = param;
    Get.to(const SearchScreen(), transition: Transition.rightToLeft);
  }

  void onSearchChanged(String param) {
    searchString.value = param;
  }

  Future<void> getWarehouseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    warehouseData.clear(); // Clear existing data before fetching new data
    try {
      SearchWarehouse getWarehouseList = SearchWarehouse(
        token: prefs.getString('token')!,
        search: searchString.value,
        maxPrice: maxPrice.value,
        minPrice: minPrice.value,
        minSize: minSize.value,
        maxSize: maxSize.value,
      );
      final response =
          await warehoouseServices.getWarehouseList(getWarehouseList);
      Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          warehouseData.value = [];
        } else {
          List<dynamic> warehouseList = responseData['data'];
          warehouseData.addAll(warehouseList);
        }
        // Add fetched data to the list
      } else {
        Get.snackbar(
          response.statusCode.toString(),
          '${responseData['message']}',
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
