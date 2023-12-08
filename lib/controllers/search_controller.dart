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

  RxBool recommended = false.obs;
  RxBool lowerPrice = false.obs;
  RxBool higherPrice = false.obs;
  // RxList<dynamic>? warehouseData;
  RxList<dynamic> warehouseData = <dynamic>[].obs;


  void onSearchSubmitted(String param) {
    searchString.value = param;
    Get.to(const SearchScreen(), transition: Transition.rightToLeft);
  }

  void onSearchChanged(String param) {
    searchString.value = param;
  }

  void onRecommendedChange(bool param) {
    lowerPrice.value = false;
    higherPrice.value = false;
    recommended.value = param;
  }

  void onLowerPriceChange(bool param) {
    recommended.value = false;
    higherPrice.value = false;
    lowerPrice.value = param;
  }

  void onHigherPriceChange(bool param) {
    recommended.value = false;
    lowerPrice.value = false;
    higherPrice.value = param;
  }

  void onFilterChange(SearchWarehouse param) {
    minPrice.value = param.minPrice;
    maxPrice.value = param.maxPrice;
    maxSize.value = param.maxSize;
    minSize.value = param.minSize;
    // Get.back;
    // getWarehouseData();
  }

  void resetFilter() {
    minPrice.value = '';
    maxPrice.value = '';
    maxSize.value = '';
    minSize.value = '';

    recommended.value = false;
    lowerPrice.value = false;
    higherPrice.value = false;
  }

  Future<void> getWarehouseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    warehouseData.clear();
    try {
      SearchWarehouse getWarehouseList = SearchWarehouse(
        token: prefs.getString('token')!,
        search: searchString.value,
        maxPrice: maxPrice.value,
        minPrice: minPrice.value,
        minSize: minSize.value,
        maxSize: maxSize.value,
      );

      if (recommended.value) {
        final response =
            await warehoouseServices.getRecommendedWarehouse(getWarehouseList);
        Map<String, dynamic> responseData = json.decode(response.body);
        print(response.statusCode);

        if (response.statusCode == 200) {
          if (responseData['data'] == null) {
            warehouseData.value = [];
          } else {
            List<dynamic> warehouseList = responseData['data'];
            warehouseData.addAll(warehouseList);
          }
        } else {
          Get.snackbar(
            response.statusCode.toString(),
            '${responseData['message']}',
          );
        }
      } else if (lowerPrice.value) {
        final response =
            await warehoouseServices.getLowerPriceWarehouse(getWarehouseList);
        Map<String, dynamic> responseData = json.decode(response.body);
        if (response.statusCode == 200) {
          if (responseData['data'] == null) {
            warehouseData.value = [];
          } else {
            List<dynamic> warehouseList = responseData['data'];
            warehouseData.addAll(warehouseList);
          }
        } else {
          Get.snackbar(
            response.statusCode.toString(),
            '${responseData['message']}',
          );
        }
      } else if (higherPrice.value) {
        final response =
            await warehoouseServices.getHigestPriceWarehouse(getWarehouseList);
        Map<String, dynamic> responseData = json.decode(response.body);
        if (response.statusCode == 200) {
          if (responseData['data'] == null) {
            warehouseData.value = [];
          } else {
            List<dynamic> warehouseList = responseData['data'];
            warehouseData.addAll(warehouseList);
          }
        } else {
          Get.snackbar(
            response.statusCode.toString(),
            '${responseData['message']}',
          );
        }
      } else {
        final response =
            await warehoouseServices.getWarehouseList(getWarehouseList);

        print(response.statusCode);
        print(response.body);

        // Map<String, dynamic> responseData = json.decode(response.body);
        if (response.statusCode == 200) {
          try {
            Map<String, dynamic> responseData = jsonDecode(response.body);
            if (responseData.containsKey('data') &&
                responseData['data'] != null) {
              List<dynamic> warehouseList = responseData['data'];
              warehouseData.addAll(warehouseList);
            } else {
              warehouseData.value = []; // Set warehouseData to an empty list
            }
            // if (responseData['data'] == null) {
            //   warehouseData.value = [];
            // } else {
            //   List<dynamic> warehouseList = responseData['data'];
            //   warehouseData.addAll(warehouseList);
            // }
          } catch (e) {
            print(e);
          }
        } else {
          // Map<String, dynamic> responseData = json.decode(response.body);
          Get.snackbar(response.statusCode.toString(), 'something went wrong'
              // '${responseData['message']}',
              );
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
