import 'dart:convert';

import 'package:capstone_wms/services/mywarehouse_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWarehouseController extends GetxController {
  MyWarehouseServices myWarehouseService = MyWarehouseServices();

  RxBool isLoading = false.obs;

  RxList<dynamic> submittedWarehouse = <dynamic>[].obs;
  RxList<dynamic> acceptedWarehouse = <dynamic>[].obs;

  Future<void> getSubmittedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    submittedWarehouse.clear();

    try {
      final response =
          await myWarehouseService.getSubmittedRent(prefs.getString('token')!);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          submittedWarehouse.value = [];
        } else {
          List<dynamic> submittedWarehouseList = responseData['data'];
          submittedWarehouse.addAll(submittedWarehouseList);
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
      isLoading.value = false;
    }
  }

  Future<void> getRentedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    acceptedWarehouse.clear();

    try {
      final response = await myWarehouseService
          .getRentedWarehouse(prefs.getString('token')!);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          acceptedWarehouse.value = [];
        } else {
          List<dynamic> submittedWarehouseList = responseData['data'];
          acceptedWarehouse.addAll(submittedWarehouseList);
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
      isLoading.value = false;
    }
  }
}
