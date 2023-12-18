import 'dart:async';
import 'dart:convert';

import 'package:capstone_wms/controllers/forgotpw_controller.dart';
import 'package:capstone_wms/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:get/get.dart';

class BottomSheetOTP extends StatefulWidget {
  BottomSheetOTP({super.key, required this.onOTPNextPressed});

  final VoidCallback onOTPNextPressed;

  @override
  State<BottomSheetOTP> createState() => _BottomSheetOTPState();
}

class _BottomSheetOTPState extends State<BottomSheetOTP> {
  TextEditingController otpCont1 = TextEditingController();
  TextEditingController otpCont2 = TextEditingController();
  TextEditingController otpCont3 = TextEditingController();
  TextEditingController otpCont4 = TextEditingController();
  bool isLoading = false;
  bool isCooldown = false;
  int _timerDuration = 180; // 3 minutes in seconds
  int _currentSeconds = 180;
  VerifyController forgotPWController = Get.put(VerifyController());

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  // Future<void> inputOTP() async {
  //   String otp =
  //       otpCont1.text + otpCont2.text + otpCont3.text + otpCont4.text.trim();

  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     final response = await AuthService.verifyOtp(
  //       forgotPWController.email.value,
  //       otp,
  //     );

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);

  //       if (responseData["status"]) {
  //         forgotPWController.setVerifyID(responseData["data"]["verfyId"]);
  //         widget.onOTPNextPressed();
  //       } else {
  //         Get.snackbar("Peringatan", responseData["message"]);
  //       }
  //     } else {
  //       Get.snackbar(
  //         "Error",
  //         "Failed to verify OTP. Status code: ${response.statusCode}",
  //       );
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  bool areFieldsFilled() {
    return otpCont1.text.isNotEmpty &&
        otpCont2.text.isNotEmpty &&
        otpCont3.text.isNotEmpty &&
        otpCont4.text.isNotEmpty;
  }

  Future<void> inputOTP() async {
    String otp =
        otpCont1.text + otpCont2.text + otpCont3.text + otpCont4.text.trim();

    try {
      setState(() {
        isLoading = true;
      });

      final otpResponse =
          await AuthService().verifyOtp(forgotPWController.email.value, otp);
      final otpData = json.decode(otpResponse.body);
      if (otpResponse.statusCode == 200) {
        // final otpData = json.decode(otpResponse.body);
        if (otpData["status"]) {
          forgotPWController.setVerifyID(otpData["data"]["verfyId"]);
          widget.onOTPNextPressed();
        } else {
          Get.snackbar("Peringatan", otpData["message"]);
        }
      } else {
        Get.snackbar("Error", otpData["message"],
            backgroundColor: colorApp.light1);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getNewPasswordOTP() async {
    try {
      final response =
          await AuthService().resendOTP(forgotPWController.email.value);

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("Peringatan", "OTP Dikirm Ulang",
            backgroundColor: colorApp.light1);
      } else {
        Get.snackbar("Peringatan", responseData["message"],
            backgroundColor: colorApp.light1);
      }
    } catch (e) {
      print(e);
    }
  }
  // Future<void> getNewPasswordOTP() async {
  //   try {
  //     final responseData =
  //         await AuthService.resendOTP(forgotPWController.email.value);
  //     if (responseData["status"]) {
  //       // forgotPWController.setEmail(emailCont.text);
  //       Get.snackbar("Peringatan", "OTP Dikirm Ulang");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void dispose() {
    otpCont1.dispose();
    otpCont2.dispose();
    otpCont3.dispose();
    otpCont4.dispose();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      isCooldown = true;
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          setState(() {
            isCooldown = false;
          });
          timer.cancel(); // Stop the timer
        }
      });
    });
  }

  String formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.409,
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
                    'Masukan 4 Digit Kode',
                    style: textApp.heading4,
                  ),
                  Text(
                    'Silahkan masukkan 4 digit kode yang diterima melalui email anda',
                    style: textApp.bodySmall
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 65,
                        child: TextField(
                          style: textApp.heading2.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          controller: otpCont1,
                          textAlign: TextAlign.center,
                          decoration:
                              fieldStyle.otpField.copyWith(counterText: ''),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 65,
                        child: TextField(
                          style: textApp.heading2.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          controller: otpCont2,
                          textAlign: TextAlign.center,
                          decoration:
                              fieldStyle.otpField.copyWith(counterText: ''),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 65,
                        child: TextField(
                          style: textApp.heading2.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          controller: otpCont3,
                          textAlign: TextAlign.center,
                          decoration:
                              fieldStyle.otpField.copyWith(counterText: ''),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 65,
                        child: TextField(
                          style: textApp.heading2.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          controller: otpCont4,
                          textAlign: TextAlign.center,
                          decoration:
                              fieldStyle.otpField.copyWith(counterText: ''),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'belum menerima email? ',
                        style: textApp.bodySmall.copyWith(
                            color: colorApp.dark1,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      if (!isCooldown)
                        GestureDetector(
                          onTap: () {
                            getNewPasswordOTP();
                            startTimer();
                          },
                          child: Text(
                            'klik untuk mengirim ulang',
                            textAlign: TextAlign.start,
                            style: textApp.bodySmall.copyWith(
                                color: const Color(0xFF0063F7),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      if (isCooldown)
                        Text(
                          formatDuration(_currentSeconds),
                          textAlign: TextAlign.start,
                          style: textApp.bodySmall.copyWith(
                              color: const Color(0xFF0063F7),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (isLoading)
                    LinearProgressIndicator(color: colorApp.secondaryColor),
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
                                  if (otpCont1.text.isEmpty ||
                                      otpCont2.text.isEmpty ||
                                      otpCont3.text.isEmpty ||
                                      otpCont4.text.isEmpty) {
                                    Get.snackbar(
                                        "Peringatan", "Harap Isi Semua Field");
                                  } else {
                                    inputOTP();
                                  }
                                }
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: Text(
                              'Lanjutkan',
                              style: textApp.bodySmall
                                  .copyWith(color: colorApp.light1),
                            ),
                          )),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
