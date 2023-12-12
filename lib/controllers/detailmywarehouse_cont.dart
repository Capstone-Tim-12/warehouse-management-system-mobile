import 'dart:convert';

import 'package:capstone_wms/screens/payment/payment_screen_success.dart';
import 'package:capstone_wms/services/mywarehouse_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailMyWarehouseController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isTranInfoLoading = false.obs;
  RxBool isInstallmentLoading = false.obs;
  RxBool isCheckPaymentLoading = false.obs;
  MyWarehouseServices myWarehouseService = MyWarehouseServices();

  RxString idTransaksi = ''.obs;
  RxInt instalmentID = 0.obs;

  RxMap warehouseInfo = {}.obs;
  // RxList<dynamic> warehouseInfo = <dynamic>[].obs;
  RxList<dynamic> instalmentList = <dynamic>[].obs;
  RxList<dynamic> paidInstalmentList = <dynamic>[].obs;
  // RxList<dynamic> transactionInfo = <dynamic>[].obs;
  RxMap transactionInfo = {}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void setTransInstalID(String idTransaksiParam, int idInstallment) {
    idTransaksi.value = idTransaksiParam;
    instalmentID.value = idInstallment;
  }

  Future<void> getTransactionInfo(String transactionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isTranInfoLoading.value = true;
    transactionInfo.clear();

    try {
      final response = await myWarehouseService.getTransactionIfo(
          prefs.getString('token')!, transactionId);
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        transactionInfo.value = responseData['data'];
      } else {
        Get.snackbar('Peringatan', responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isTranInfoLoading.value = false;
    }
  }

  Future<void> getWarehouseInfo(
      String warehouseId, String transactionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    warehouseInfo.clear();
    try {
      final response = await myWarehouseService.getWarehouseInfo(
          prefs.getString('token')!, warehouseId.toString());
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        warehouseInfo.value = responseData['data'];
      } else {
        Get.snackbar('Peringatan', responseData['message']);
      }
      print(response.statusCode);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getInstalmentList(String transactionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isCheckPaymentLoading.value = true;
    instalmentList.clear();
    paidInstalmentList.clear();
    try {
      final response = await myWarehouseService.getInstallmentList(
          prefs.getString('token')!, transactionId);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print('getBill : ${response.statusCode}');
      print(responseData);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          instalmentList.value = [];
          paidInstalmentList.value = [];
        } else {
          List<dynamic> installmentDataList = responseData['data'];

          for (var installmentData in installmentDataList) {
            int instalmentId = installmentData['instalmentId'];
            String dueDate = installmentData['dueDate'];
            int nominal = installmentData['nominal'];
            String status = installmentData['status'];

            if (status == 'dibayar') {
              paidInstalmentList.add({
                'instalmentId': instalmentId,
                'dueDate': dueDate,
                'nominal': nominal,
                'status': status,
              });
            } else {
              instalmentList.add({
                'instalmentId': instalmentId,
                'dueDate': dueDate,
                'nominal': nominal,
                'status': status,
              });
            }
          }

          // instalmentList.addAll(installmentList);
        }
      } else {
        Get.snackbar('Peringatan', responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isInstallmentLoading.value = false;
      print(instalmentList);
    }
  }

  Future<void> checkIsPaid(String transactionId, int billId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isInstallmentLoading.value = true;

    try {
      final response = await myWarehouseService.getInstallmentList(
          prefs.getString('token')!, transactionId);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print('getBill : ${response.statusCode}');
      print(responseData);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          instalmentList.value = [];
          paidInstalmentList.value = [];
        } else {
          List<dynamic> installmentDataList = responseData['data'];

          for (var installmentData in installmentDataList) {
            int instalmentId = installmentData['instalmentId'];
            String dueDate = installmentData['dueDate'];
            int nominal = installmentData['nominal'];
            String status = installmentData['status'];

            if (instalmentId == billId && status == 'dibayar') {
              Get.to(() => const PaymentSuccess());
              break;
            } else {
              Get.snackbar("Peringatan", "Pembayaran Belum Selesai");
            }
          }

          // instalmentList.addAll(installmentList);
        }
      } else {
        Get.snackbar('Peringatan', responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isCheckPaymentLoading.value = false;
      print(instalmentList);
    }
  }
}
