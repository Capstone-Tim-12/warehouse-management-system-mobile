import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/screens/main/dashboard/dashboard.dart';
import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSuccess extends StatelessWidget {
  VerificationSuccess({super.key});

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  Widget build(BuildContext context) {
    final sizeCollection = SizeCollection(context);

    double screenWidth = sizeCollection.screenWidth;
    double screenHeight = sizeCollection.screenHeight;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Align(
      //     alignment: Alignment.centerRight,
      //     child: Text(
      //       'Skip',
      //       style: textApp.extraSmallInvLabel,
      //     ),
      //   ),
      //   automaticallyImplyLeading: false,
      //   // leading: const BackButton(),
      // ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: screenWidth,
          height: screenHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_rounded,
                  color: colorApp.stateSuccess,
                  size: 180,
                ),
                Text(
                  'Verifikasi Identitas Anda Berhasil',
                  style: textApp.heading6.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: colorApp.stateSuccess),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.887,
                  child: Text(
                    'Silakan lihat menu ‘Profil’ untuk mengetahui status verifikasi identitas akun anda ',
                    style:
                        textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )),

      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorApp.mainColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () {
                Get.offAll(() => const MainScreen());
              },
              child: Text(
                'Kembali ke Beranda',
                style: textApp.bodySmall
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}
