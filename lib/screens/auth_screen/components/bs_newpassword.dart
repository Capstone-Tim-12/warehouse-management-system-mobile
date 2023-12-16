import 'dart:convert';

import 'package:capstone_wms/controllers/forgotpw_controller.dart';
import 'package:capstone_wms/services/authentication.dart';
import 'package:capstone_wms/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomSheetNewPW extends StatefulWidget {
  const BottomSheetNewPW({super.key, required this.onPWConfirmedPressed});

  final VoidCallback onPWConfirmedPressed;

  @override
  State<BottomSheetNewPW> createState() => _BottomSheetNewPWState();
}

class _BottomSheetNewPWState extends State<BottomSheetNewPW> {
  TextEditingController newPwCont = TextEditingController();
  TextEditingController reNewPwCont = TextEditingController();
  bool isLoading = false;
  VerifyController forgotPWController = Get.put(VerifyController());
  bool isPasswordVisible = false;
  bool isNewPasswordVisible = false;

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  AuthService authService = AuthService();
  FirebaseServices firebase = FirebaseServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPasswordVisible = true;
    isNewPasswordVisible = true;
  }

  void showPw() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void showNewPw() {
    setState(() {
      isNewPasswordVisible = !isNewPasswordVisible;
    });
  }

  bool areFieldsFilled() {
    return newPwCont.text.length >= 6 && reNewPwCont.text.length >= 6;
  }

  Future<void> resetNewPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      final responseData = await AuthService().resetPassword(
          forgotPWController.verifyId.value,
          forgotPWController.email.value,
          newPwCont.text);

      if (responseData["status"]) {
        final loginData = await authService.logInUser(
            forgotPWController.email.value, newPwCont.text);
        final loginResponseData = json.decode(loginData.body);

        if (loginData.statusCode == 200) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('userId', loginResponseData["data"]["userId"]);
          prefs.setString('name', loginResponseData["data"]["name"]);
          prefs.setString('token', loginResponseData["data"]["token"]);
          prefs.setString(
            'email',
            forgotPWController.email.value,
          );
          String? userDoc =
              await firebase.getUserDocumentID(responseData["data"]["userId"]);

          prefs.setString('userDoc', userDoc!);

          widget.onPWConfirmedPressed();
        } else if (loginData.statusCode == 400) {
          final responseData = json.decode(loginResponseData.body);
          Get.snackbar("Peringatan", responseData["message"],
              backgroundColor: Colors.white);
        } else if (loginData.statusCode == 404) {
          final responseData = json.decode(loginResponseData.body);
          Get.snackbar("Perignatan", responseData["message"],
              backgroundColor: Colors.white);
        } else {
          Get.snackbar(
              "Error", "Failed to log in. Status code: ${loginData.statusCode}",
              backgroundColor: Colors.white);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newPwCont.dispose();
    reNewPwCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.3585,
          height: MediaQuery.of(context).size.height * 0.456,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(28),
              )),
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.0561,
              right: MediaQuery.of(context).size.width * 0.0561,
              top: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Kata Sandi',
                  style: textApp.heading4,
                ),
                Text(
                  'Aturlah kata sandi yang baru untuk akun anda agar dapat login dan mengakses semua fitur yang tersedia',
                  style: textApp.bodySmall
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      newPwCont.text = value;
                    });
                  },
                  controller: newPwCont,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    hintText: 'Masukkan Kata Sandi Baru',
                    suffixIcon: IconButton(
                      onPressed: showPw,
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFf8f4fc),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide.none, // Set borderSide to BorderSide.none
                    ),
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      reNewPwCont.text = value;
                    });
                  },
                  controller: reNewPwCont,
                  obscureText: isNewPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Ulang Kata Sandi',
                    hintText: 'Masukkan Kembali Kata Sandi',
                    suffixIcon: IconButton(
                      onPressed: showNewPw,
                      icon: Icon(isNewPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFf8f4fc),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide.none, // Set borderSide to BorderSide.none
                    ),
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isLoading)
                  LinearProgressIndicator(
                    color: colorApp.secondaryColor,
                  ),
                if (!isLoading)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                colorApp.secondaryColorLighter,
                            backgroundColor: colorApp.secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: areFieldsFilled()
                            ? () {
                                if (newPwCont.text.isEmpty ||
                                    reNewPwCont.text.isEmpty) {
                                  Get.snackbar(
                                      "Peringatan", "Harap Isi Password Baru");
                                } else {
                                  if (newPwCont.text != reNewPwCont.text) {
                                    Get.snackbar(
                                      "Peringatan",
                                      "Password Tidak Sama",
                                    );
                                  } else {
                                    resetNewPassword();
                                  }
                                }
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 24),
                          child: Text(
                            'Ganti Kata Sandi',
                            style: textApp.bodySmall
                                .copyWith(color: colorApp.light1),
                          ),
                        )),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
