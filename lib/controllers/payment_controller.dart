import 'dart:convert';

import 'package:capstone_wms/models/virtualaccount_model.dart';
import 'package:capstone_wms/screens/payment/payment_screen_success.dart';
import 'package:capstone_wms/screens/payment/payment_virtual_account.dart';
import 'package:capstone_wms/services/firebase_services.dart';
import 'package:capstone_wms/services/mywarehouse_services.dart';
import 'package:capstone_wms/services/payment_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt selectedPeymentId = 0.obs;
  RxString selectedBankCode = ''.obs;
  RxString paymentInfo = ''.obs;

  RxBool isLoading = false.obs;
  RxBool isVALoading = false.obs;
  RxBool isPaymentLoading = false.obs;
  RxMap warehouseInfo = {}.obs;

  //======Payment Response================================================
  RxString xPaymentId = ''.obs;
  RxString virtualAccountName = ''.obs;
  RxString virtualAccountNumber = ''.obs;
  RxString bankCodeResponse = ''.obs;
  RxInt nominal = 0.obs;
  RxString expiredAt = ''.obs;
  //======================================================================

  RxList<dynamic> virtualAccountList = <dynamic>[].obs;
  MyWarehouseServices myWarehouseService = MyWarehouseServices();
  PaymentServices paymentService = PaymentServices();
  FirebaseServices firebase = FirebaseServices();

  Future<void> getWarehouseInfo(String warehouseId) async {
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

  Future<void> getVAList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isVALoading.value = true;
    virtualAccountList.clear();

    try {
      final response =
          await paymentService.getBankVAList(prefs.getString('token')!);
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          virtualAccountList.value = [];
        } else {
          List<dynamic> bankVAList = responseData['data'];
          virtualAccountList.addAll(bankVAList);
        }
      } else {
        Get.snackbar("Peringatan", responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isVALoading.value = false;
    }
  }

  Future<void> payVAWarehouse(int installmentId, String bankCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    isPaymentLoading.value = true;
    paymentInfo.value = '';

    try {
      final response = await paymentService.checkoutPayment(
          token, 1, installmentId, bankCode);

      print(response.statusCode);

      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          paymentInfo.value = '';
        } else {
          String paymentInfoJson = responseData['data']['paymentInfo'];
          Map<String, dynamic> paymentInfoMap = jsonDecode(paymentInfoJson);

          xPaymentId.value = paymentInfoMap['xPaymentId'];
          virtualAccountName.value = paymentInfoMap['virtualAccountName'];
          virtualAccountNumber.value = paymentInfoMap['virtualAccountNumber'];
          bankCodeResponse.value = paymentInfoMap['bankCode'];
          nominal.value = paymentInfoMap['nominal'];
          expiredAt.value = paymentInfoMap['expiredAt'];
          // paymentInfo.value = responseData['message'];

          VirtualAccountModel newTransaction = VirtualAccountModel(
              vaNumber: virtualAccountNumber.value,
              vaName: virtualAccountName.value,
              bankCode: bankCodeResponse.value,
              nominal: nominal.value,
              expiredAt: expiredAt.value,
              xPaymentId: xPaymentId.value);

          await firebase.addTransaction(newTransaction);

          Get.to(() => const VirtualAccountScreen());
        }
      } else {
        Get.snackbar(response.statusCode.toString(), responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isPaymentLoading.value = false;
    }
  }
}
