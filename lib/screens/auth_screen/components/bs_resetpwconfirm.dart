import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:get/get.dart';

class KonfirmasiResetPW extends StatefulWidget {
  const KonfirmasiResetPW({super.key});

  @override
  State<KonfirmasiResetPW> createState() => _KonfirmasiResetPWState();
}

class _KonfirmasiResetPWState extends State<KonfirmasiResetPW> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.473,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Reset Kata Sandi Berhasil',
                    style: textApp.heading4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0129,
                  ),
                  Icon(
                    Icons.check,
                    color: colorApp.secondaryColor,
                    size: 200,
                  ),
                  Text(
                    'Password anda telah sukses diubah, silahkan tekan masuk untuk mencoba kata sandi baru anda',
                    style: textApp.bodySmall
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) => const MainScreen()),
                          //     (route) => false);
                          Get.offAll(() => const MainScreen());
                        },
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
                ],
              )),
        ),
      ),
    );
  }
}
