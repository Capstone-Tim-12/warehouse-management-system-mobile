import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/alertdialogberhasil.dart';
import 'package:capstone_wms/components/alertdialoggagal.dart';
import 'package:capstone_wms/components/showbottomsheetberhasil.dart';
import 'package:capstone_wms/components/showbottomsheetgagal.dart';
import 'package:capstone_wms/controllers/profile_controller.dart';
import 'package:capstone_wms/screens/main/profile/emailverifikasi.dart';
import 'package:capstone_wms/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDialogOtp(BuildContext ctx, String email) {
  TextEditingController otpCont1 = TextEditingController();
  TextEditingController otpCont2 = TextEditingController();
  TextEditingController otpCont3 = TextEditingController();
  TextEditingController otpCont4 = TextEditingController();

  // AuthService auth = AuthService();
  ProfileController profileCont = Get.put(ProfileController());
  bool areFieldsFilled() {
    return otpCont1.text.isEmpty &&
        otpCont2.text.isEmpty &&
        otpCont3.text.isEmpty &&
        otpCont4.text.isEmpty;
  }

  showDialog(
    barrierDismissible: false,
    context: ctx,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(bottom: 32, top: 32),
        child: AlertDialog(
          backgroundColor: colorApp.mainColor,
          contentPadding: const EdgeInsets.only(right: 16, left: 16, top: 24),
          title: Text(
            'kode sudah dikirim ke $email',
            textAlign: TextAlign.center,
            style: TextCollection().heading7.copyWith(color: ColorApp().light3),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
                child: TextField(
                  controller: otpCont1,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorApp.dark4,
                    counter: const Offstage(),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
                child: TextField(
                  controller: otpCont2,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorApp.dark4,
                    counter: const Offstage(),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
                child: TextField(
                  controller: otpCont3,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorApp.dark4,
                    counter: const Offstage(),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
                child: TextField(
                  controller: otpCont4,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorApp.dark4,
                    counter: const Offstage(),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tidak menerima email?',
                  style: TextCollection()
                      .smallLabelBlack
                      .copyWith(color: colorApp.light3),
                ),
                const SizedBox(width: 2),
                InkWell(
                  child: Text(
                    'Kirim Ulang',
                    style: TextCollection().normalLabel,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorApp.secondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: profileCont.isOTPProcessed.value
                      ? null
                      : () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const EmailVerifikasi()),
                          // );
                          alertDialogGagal(context);
                        },
                  child: Text('Batalkan',
                      style: TextCollection()
                          .normalLabel
                          .copyWith(color: colorApp.light3)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: colorApp.secondaryColorLighter,
                      backgroundColor: colorApp.secondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: profileCont.isOTPProcessed.value
                      ? null
                      : () async {
                          String otp = otpCont1.text +
                              otpCont2.text +
                              otpCont3.text +
                              otpCont4.text.trim();
                          if (otp.length != 4) {
                            Get.snackbar("Peringatan", 'Harap Masukan OTP');
                          } else {
                            await profileCont.processOTP(email, otp, context);
                            await profileCont.getUserInfo();
                          }
                        },
                  // onPressed: () {
                  //   String otp = otpCont1.text +
                  //       otpCont2.text +
                  //       otpCont3.text +
                  //       otpCont4.text.trim();

                  //   print(otp);
                  // },
                  child: Text('Konfirmasi',
                      style: TextCollection()
                          .normalLabel
                          .copyWith(color: colorApp.light3)),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
