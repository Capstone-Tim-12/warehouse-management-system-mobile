import 'dart:convert';

import 'package:capstone_wms/models/locationapi_model.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_forgotpw.dart';
import 'package:capstone_wms/screens/main/dashboard/dashboard.dart';
import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:capstone_wms/services/authentication.dart';
import 'package:capstone_wms/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomSheetLogin extends StatefulWidget {
  const BottomSheetLogin(
      {super.key,
      required this.onForgotPasswordPressed,
      required this.onSignUpPressed});

  final VoidCallback onForgotPasswordPressed;
  final VoidCallback onSignUpPressed;

  @override
  State<BottomSheetLogin> createState() => _BottomSheetLoginState();
}

class _BottomSheetLoginState extends State<BottomSheetLogin> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordcCont = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;
  String errorMessage = '';

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
  }

  void showPw() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  bool areFieldsFilled() {
    return emailCont.text.length >= 5 && passwordcCont.text.length >= 6;
  }

  // Future<void> loginUser() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     final responseData = await AuthService.logInUser(
  //       emailCont.text,
  //       passwordcCont.text,
  //     );

  //     if (responseData["status"]) {
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setInt('userId', responseData["data"]["userId"]);
  //       prefs.setString('name', responseData["data"]["name"]);
  //       prefs.setString('token', responseData["data"]["token"]);

  //       // setState(() {
  //       //   isLoading = false;
  //       // });
  //       // Navigator.of(context).pushReplacement(
  //       //     MaterialPageRoute(builder: (context) => const MainScreen()));
  //       Get.offAll(() => const MainScreen());
  //     } else {
  //       Get.snackbar("Peringatan", "Email atau PAssword Salah");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  //===================================================================================

  Future<void> loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await authService.logInUser(
        emailCont.text,
        passwordcCont.text,
      );
      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData["status"]) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('userId', responseData["data"]["userId"]);
          prefs.setString('name', responseData["data"]["name"]);
          prefs.setString('token', responseData["data"]["token"]);
          prefs.setString('email', emailCont.text);

          String? userDoc =
              await firebase.getUserDocumentID(responseData["data"]["userId"]);

          // print(userDoc);

          prefs.setString('userDoc', userDoc!);

          Get.offAll(() => const MainScreen());
        } else {
          Get.snackbar("Peringatan", responseData["message"],
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        setState(() {
          errorMessage = responseData["message"];
        });
        // Get.snackbar(
        //   "Peringatan",
        //   responseData["message"],
        //   backgroundColor: Colors.white,
        // );
        // Get.snackbar("Peringatan", responseData["message"],
        //     backgroundColor: Colors.white,
        //     snackPosition: SnackPosition.BOTTOM,
        //     snackStyle: SnackStyle.FLOATING,
        //     );
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
    // TODO: implement dispose
    super.dispose();
    emailCont.dispose();
    passwordcCont.dispose();
  }

  //========================================================================================

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            // height: MediaQuery.of(context).size.height * 0.617,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(28),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.0561,
                  vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masuk',
                    style: textApp.heading4,
                  ),
                  Text(
                    'Selamat datang, silahkan masuk terlebih dahulu untuk melanjutkan!',
                    style: textApp.bodySmall
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                      onChanged: (value) {
                        setState(() {
                          emailCont.text = value;
                          errorMessage = '';
                        });
                      },
                      controller: emailCont,
                      decoration: fieldStyle.emailField,
                      validator: (value) {
                        if (errorMessage == 'email not found') {
                          return errorMessage;
                        }
                        if (errorMessage ==
                            'input email has on the email tag') {
                          return errorMessage;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction),
                  // TextField(
                  //   onChanged: (value) {
                  //     setState(() {
                  //       emailCont.text = value;
                  //     });
                  //   },
                  //   controller: emailCont,
                  //   decoration: fieldStyle.emailField,
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        passwordcCont.text = value;
                        errorMessage = '';
                      });
                    },
                    controller: passwordcCont,
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
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
                        borderSide: BorderSide
                            .none, // Set borderSide to BorderSide.none
                      ),
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                    ),
                    validator: (value) {
                      if (errorMessage == 'invalid password') {
                        return errorMessage;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  // TextField(
                  //   onChanged: (value) {
                  //     setState(() {
                  //       passwordcCont.text = value;
                  //     });
                  //   },
                  //   controller: passwordcCont,
                  //   obscureText: isPasswordVisible,
                  //   decoration: InputDecoration(
                  //     labelText: 'Password',
                  //     hintText: 'Enter Your Password',
                  //     suffixIcon: IconButton(
                  //       onPressed: showPw,
                  //       icon: Icon(isPasswordVisible
                  //           ? Icons.visibility
                  //           : Icons.visibility_off),
                  //     ),
                  //     filled: true,
                  //     fillColor: const Color(0xFFf8f4fc),
                  //     border: const OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //       borderSide: BorderSide
                  //           .none, // Set borderSide to BorderSide.none
                  //     ),
                  //     prefixIcon: const Icon(Icons.lock_outline_rounded),
                  //   ),
                  // ),
                  // const SizedBox(height: 1),
                  GestureDetector(
                    onTap: () {
                      widget.onForgotPasswordPressed();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Lupa Kata Sandi?',
                        textAlign: TextAlign.start,
                        style: textApp.bodySmall.copyWith(
                            color: const Color(0xFF0063F7),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 14,
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
                                  if (emailCont.text.isEmpty) {
                                    Get.snackbar("Peringatan",
                                        "Email dan Password Tidak dapat kosong",
                                        colorText: colorApp.mainColor,
                                        backgroundColor: colorApp.light1);
                                  } else {
                                    loginUser();
                                  }
                                }
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: Text(
                              'Masuk',
                              style: textApp.bodySmall
                                  .copyWith(color: colorApp.light1),
                            ),
                          )),
                    ),

                  const SizedBox(
                    height: 14,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ' or sign in with ',
                        style: textApp.largeLabelBlack,
                      ),
                      Container(
                        width: 56,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          width: 45,
                          height: 45,
                          child: Padding(
                            padding: paddingApp.iconPadding,
                            child: SvgPicture.asset('assets/svg/g_logo.svg'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          width: 45,
                          height: 45,
                          child: Padding(
                            padding: paddingApp.iconPadding,
                            child: SvgPicture.asset('assets/svg/fb_logo.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Belum Memiliki Akun? ',
                        style: textApp.bodySmall.copyWith(
                            color: colorApp.dark1, fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onSignUpPressed();
                        },
                        child: Text(
                          'Daftar',
                          textAlign: TextAlign.start,
                          style: textApp.bodySmall.copyWith(
                              color: const Color(0xFF0063F7),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
