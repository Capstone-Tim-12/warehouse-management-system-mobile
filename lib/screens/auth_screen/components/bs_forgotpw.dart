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

class BottomSheetForgotPw extends StatefulWidget {
  BottomSheetForgotPw({super.key, required this.onSendOTPPressed});

  final VoidCallback onSendOTPPressed;

  @override
  State<BottomSheetForgotPw> createState() => _BottomSheetForgotPwState();
}

class _BottomSheetForgotPwState extends State<BottomSheetForgotPw> {
  TextEditingController emailCont = TextEditingController();
  bool isLoading = false;
  VerifyController forgotPWController = Get.put(VerifyController());

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getNewPasswordOTP() async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await AuthService().resendOTP(emailCont.text);

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        forgotPWController.setEmail(emailCont.text);

        widget.onSendOTPPressed();
      } else {
        Get.snackbar("Peringatan", responseData["message"],
            backgroundColor: colorApp.light1);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  // Future<void> getNewPasswordOTP() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     final responseData = await AuthService.resendOTP(emailCont.text);

  //     if (responseData["status"]) {
  //       forgotPWController.setEmail(emailCont.text);

  //       widget.onSendOTPPressed();
  //     }
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3477,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(28),
              )),
          child: Padding(
            // padding: EdgeInsets.symmetric(
            //     horizontal: MediaQuery.of(context).size.width * 0.0561,
            //     vertical: 32),
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
                  'Lupa Kata Sandi',
                  style: textApp.heading4,
                ),
                Text(
                  'Silahkan masukkan email anda untuk proses verifikasi, kami akan mengirimkan 4 digit kode ke email tersebut.',
                  style: textApp.bodySmall
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextField(
                  controller: emailCont,
                  decoration: fieldStyle.emailField,
                ),
                const SizedBox(
                  height: 28,
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
                            backgroundColor: colorApp.secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const MainScreen()));
                          // widget.onSendOTPPressed();
                          if (emailCont.text.isEmpty) {
                            Get.snackbar("Peringatan", "Email Kosong",
                                backgroundColor: colorApp.light1,
                                colorText: colorApp.mainColor);
                          } else {
                            getNewPasswordOTP();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 24),
                          child: Text(
                            'Kirim',
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
