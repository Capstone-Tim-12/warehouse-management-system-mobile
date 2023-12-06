import 'dart:convert';

import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:capstone_wms/services/warehouse_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LowerPriceController extends GetxController {
  WarehouseServidces warehoouseServices = WarehouseServidces();
  RxList<dynamic> lowPriceData = <dynamic>[].obs;
  RxBool isLowPriceLoading = false.obs;

  Future<void> getLowPriceWarehouse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLowPriceLoading.value = true;
    lowPriceData.clear();

    try {
      SearchWarehouse lowPriceWarehouse = SearchWarehouse(
          token: prefs.getString('token')!,
          search: '',
          maxPrice: '',
          minPrice: '',
          minSize: '',
          maxSize: '');

      final response =
          await warehoouseServices.getLowerPriceWarehouse(lowPriceWarehouse);

      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          lowPriceData.value = [];
        } else {
          List<dynamic> warehouseList = responseData['data'];
          lowPriceData.addAll(warehouseList);
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
      isLowPriceLoading.value = false;
    }
  }
}
