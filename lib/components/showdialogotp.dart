import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/showbottomsheetberhasil.dart';
import 'package:capstone_wms/components/showbottomsheetgagal.dart';
import 'package:capstone_wms/screens/main/profile/emailverifikasi.dart';
import 'package:flutter/material.dart';


void showDialogOtp(BuildContext context) {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(bottom: 32, top: 32),
        child: AlertDialog(
          backgroundColor: colorApp.mainColor,
          contentPadding: const EdgeInsets.only(right: 16, left: 16, top: 24),
          title: Text(
            'kode sudah dikirim ke yuniar12@example.com',
            textAlign: TextAlign.center,
            style: TextCollection().heading7.copyWith(color: ColorApp().light3),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
                child: TextField(
                  controller: otpController1,
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
                  controller: otpController2,
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
                  controller: otpController3,
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
                  controller: otpController4,
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
                Text('Tidak menerima email?', style: TextCollection().smallLabelBlack.copyWith(color: colorApp.light3),
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: Text('Kirim Ulang', style: TextCollection().normalLabel,))
                  ],
                ),
              ],
            ),
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorApp.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const EmailVerifikasi()),
                      );
                      showBottomSheetGagal(context);
                  },
                  child: Text('Batalkan', 
                  style: TextCollection().normalLabel.copyWith(color: colorApp.light3)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorApp.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const EmailVerifikasi()),
                      );
                      showBottomSheetBerhasil(context);
                  },
                  child: Text('Konfirmasi',
                  style: TextCollection().normalLabel.copyWith(color: colorApp.light3)),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}