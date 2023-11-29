import 'dart:async';
import 'dart:convert';

import 'package:capstone_wms/controllers/signup_controller.dart';
import 'package:capstone_wms/models/user_model.dart';
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

// ini buat daftar
class BotomSheetOTPEmail extends StatefulWidget {
  const BotomSheetOTPEmail({super.key, required this.onEmailOTPPressed});

  final VoidCallback onEmailOTPPressed;

  @override
  State<BotomSheetOTPEmail> createState() => _BotomSheetOTPEmailState();
}

class _BotomSheetOTPEmailState extends State<BotomSheetOTPEmail> {
  TextEditingController otpCont1 = TextEditingController();
  TextEditingController otpCont2 = TextEditingController();
  TextEditingController otpCont3 = TextEditingController();
  TextEditingController otpCont4 = TextEditingController();
  bool isLoading = false;
  bool isCooldown = false;
  int _timerDuration = 180; // 3 minutes in seconds
  int _currentSeconds = 180;

  SignUpController signUpCont = Get.put(SignUpController());
  FirebaseServices addUserToFirestore = FirebaseServices();

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  AuthService authService = AuthService();

  // Future<void> inputOtp() async {
  //   String otp =
  //       otpCont1.text + otpCont2.text + otpCont3.text + otpCont4.text.trim();

  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     final responseData =
  //         await AuthService.verifyOtp(signUpCont.signUpUser.value.email, otp);

  //     if (responseData["status"]) {
  //       final loginData = await AuthService.logInUser(
  //         signUpCont.signUpUser.value.email,
  //         signUpCont.signUpUser.value.password,
  //       );
  //       final loginResponseData = json.decode(loginData.body);

  //       if (loginData.statusCode == 200) {
  //         if (loginResponseData["status"]) {
  //           SharedPreferences prefs = await SharedPreferences.getInstance();
  //           prefs.setInt('userId', loginResponseData["data"]["userId"]);
  //           prefs.setString('name', loginResponseData["data"]["name"]);
  //           prefs.setString('token', loginResponseData["data"]["token"]);

  //           widget.onEmailOTPPressed();
  //         }
  //       } else if (loginData.statusCode == 400) {
  //         // final loginResponseData = json.decode(loginData.body);
  //         final responseData = json.decode(loginResponseData.body);
  //         Get.snackbar("Peringatan", responseData["message"]);
  //       } else if (loginData.statusCode == 404) {
  //         // final loginResponseData = json.decode(loginData.body);
  //         final responseData = json.decode(loginResponseData.body);
  //         Get.snackbar("Perignatan", responseData["message"]);
  //       } else {
  //         Get.snackbar("Error",
  //             "Failed to log in. Status code: ${loginData.statusCode}");
  //       }
  //     } else {
  //       print("false");
  //     }
  //   } catch (e) {
  //     print(e);
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

  Future<void> inputOtp() async {
    String otp =
        otpCont1.text + otpCont2.text + otpCont3.text + otpCont4.text.trim();

    try {
      setState(() {
        isLoading = true;
      });

      final otpResponse =
          await AuthService.verifyOtp(signUpCont.signUpUser.value.email, otp);
      final otpData = json.decode(otpResponse.body);
      if (otpResponse.statusCode == 200) {
        // final otpData = json.decode(otpResponse.body);
        if (otpData["status"]) {
          final loginResponse = await authService.logInUser(
            signUpCont.signUpUser.value.email,
            signUpCont.signUpUser.value.password,
          );
          final loginResponseData = json.decode(loginResponse.body);

          if (loginResponse.statusCode == 200) {
            if (loginResponseData["status"]) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt('userId', loginResponseData["data"]["userId"]);
              await prefs.setString('name', loginResponseData["data"]["name"]);
              await prefs.setString(
                  'token', loginResponseData["data"]["token"]);
              await prefs.setString(
                'email',
                signUpCont.signUpUser.value.email,
              );

              UserModel newUser = UserModel(
                  id: '',
                  userId: prefs.getInt('userId')!,
                  email: signUpCont.signUpUser.value.email,
                  name: prefs.getString('name')!,
                  picKTP: '',
                  selKTP: '');

              await addUserToFirestore.addUser(newUser);

              String? userDoc = await addUserToFirestore
                  .getUserDocumentID(loginResponseData["data"]["userId"]);
              prefs.setString('userDoc', userDoc!);

              widget.onEmailOTPPressed();
            } else {
              Get.snackbar("Peringatan", loginResponseData["message"],
                  backgroundColor: colorApp.light1);
            }
          } else if (loginResponse.statusCode == 400 ||
              loginResponse.statusCode == 404) {
            Get.snackbar("Peringatan", loginResponseData["message"],
                backgroundColor: colorApp.light1);
          } else {
            Get.snackbar("Error",
                "Failed to log in. Status code: ${loginResponse.statusCode}");
          }
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

  // Future<void> getSignUpdOTP() async {
  //   try {
  //     final responseData =
  //         await AuthService.resendOTP(signUpCont.signUpUser.value.email);
  //     if (responseData["status"]) {
  //       // forgotPWController.setEmail(emailCont.text);
  //       Get.snackbar("Peringatan", "OTP Dikirm Ulang");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> getSignUpdOTP() async {
    try {
      final response =
          await AuthService.resendOTP(signUpCont.signUpUser.value.email);

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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  'Verifikasi Email',
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
                        onChanged: (value) {
                          setState(() {
                            otpCont1.text = value;
                          });
                        },
                        style: textApp.heading2.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        keyboardType: TextInputType.number,
                        maxLength: 1,
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
                        onChanged: (value) {
                          setState(() {
                            otpCont2.text = value;
                          });
                        },
                        style: textApp.heading2.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        keyboardType: TextInputType.number,
                        maxLength: 1,
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
                        onChanged: (value) {
                          setState(() {
                            otpCont3.text = value;
                          });
                        },
                        style: textApp.heading2.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        keyboardType: TextInputType.number,
                        maxLength: 1,
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
                        onChanged: (value) {
                          setState(() {
                            otpCont4.text = value;
                          });
                        },
                        style: textApp.heading2.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        keyboardType: TextInputType.number,
                        maxLength: 1,
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
                          getSignUpdOTP();
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
                  LinearProgressIndicator(
                    color: colorApp.secondaryColor,
                  ),
                if (isLoading == false)
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
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => const MainScreen()));
                                // widget.onEmailOTPPressed();
                                if (otpCont1.text.isEmpty ||
                                    otpCont2.text.isEmpty ||
                                    otpCont3.text.isEmpty ||
                                    otpCont4.text.isEmpty) {
                                  Get.snackbar(
                                      "Peringatan", "Harap Isi Semua Field");
                                } else {
                                  inputOtp();
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
        ));
  }
}
