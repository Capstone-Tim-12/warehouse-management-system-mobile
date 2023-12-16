import 'dart:convert';
import 'dart:io';

import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/components/alertdialogberhasil.dart';
import 'package:capstone_wms/components/showdialogotp.dart';
import 'package:capstone_wms/services/authentication.dart';
import 'package:capstone_wms/services/profile_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  ProfileServices profileService = ProfileServices();
  AuthService auth = AuthService();

  Rx<File?> selectedImg = Rx<File?>(null);
  RxBool isLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  RxBool isOTPSent = false.obs;
  RxBool isOTPProcessed = false.obs;
  RxMap userInfo = {}.obs;

  RxInt otpStatusCode = 0.obs;

  void setSelectedImg(File img) async {
    selectedImg.value = img;
  }

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;

    try {
      final response =
          await profileService.getUserInfo(prefs.getString('token')!);

      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        userInfo.value = await responseData['data'];
      } else {
        Get.snackbar("Peringatan", responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUserEmail(String newUserEmail, BuildContext ctx) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUpdateLoading.value = true;

    try {
      final response = await profileService.updateUserEmail(
          prefs.getString('token')!, newUserEmail);

      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        //nanti tampilin show dialog email terverifikasi
        showDialogOtp(ctx, newUserEmail);
      } else {
        //nanti tampilin show dialog email gagal
        Get.snackbar("Peringatan", responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isUpdateLoading.value = false;
    }
  }

  Future<void> processOTP(String email, String otp, BuildContext ctx) async {
    isOTPProcessed.value = true;
    try {
      final otpResponse = await AuthService().verifyOtp(email, otp);
      final otpData = json.decode(otpResponse.body);
      print(otpResponse.statusCode);
      if (otpResponse.statusCode == 200) {
        // final otpData = json.decode(otpResponse.body);\
        Get.back();
        alertDialogBerhasil(ctx);
      } else {
        Get.snackbar("Error", otpData["message"],
            backgroundColor: colorApp.light1);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isOTPProcessed.value = false;
    }
  }

  Future<void> updateUsername(String newUsername) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUpdateLoading.value = true;
    try {
      final response = await profileService.updateUserName(
          prefs.getString('token')!, newUsername);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("Peringatan", "Username telah diganti");
      } else {
        Get.snackbar("Peringatan", responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isUpdateLoading.value = false;
    }
  }

  Future<void> updatePhotoProfile(dynamic foto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUpdateLoading.value = true;
    String tokn = prefs.getString('token')!;
    try {
      final response = await profileService.uploadFoto(tokn, foto);

      Map<String, dynamic> responseData = response.data;

      if (response.statusCode == 200) {
        String imgUrl = responseData['urlImage'];
        final uploadPfp = await profileService.updateProfilePic(tokn, imgUrl);
        Map<String, dynamic> responseUpdateImg = jsonDecode(uploadPfp.body);
        if (uploadPfp.statusCode == 200) {
          Get.snackbar("Peringatan", "Photo Profile Berhasil");
        } else {
          Get.snackbar("Peringatan", responseUpdateImg['message']);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isUpdateLoading.value = false;
    }
  }

  Future<void> updatePFPwithAvatar(String imgUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUpdateLoading.value = true;
    String tokn = prefs.getString('token')!;

    try {
      final response = await profileService.updateProfilePic(tokn, imgUrl);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.back();
      } else {
        Get.snackbar("Peringatan", responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isUpdateLoading.value = false;
    }
  }

  // Future<void> sendOTP(String email) async {
  //   isOTPSent.value = true;
  //   try {
  //     final response = await AuthService.resendOTP(email);
  //     Map<String, dynamic> responseData = jsonDecode(response.body);

  //     if (response.statusCode == 200) {
  //       otpStatusCode.value = response.statusCode;
  //     } else {
  //       Get.snackbar("Peringatan", responseData['message']);
  //     }
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     isOTPSent.value = false;
  //   }
  // }
}
