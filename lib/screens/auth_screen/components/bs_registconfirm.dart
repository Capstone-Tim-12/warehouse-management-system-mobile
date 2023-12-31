import 'package:capstone_wms/screens/auth_screen/user_identity/idverconf.dart';
import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:get/get.dart';

class KonfirmasiRegister extends StatefulWidget {
  const KonfirmasiRegister({super.key});

  @override
  State<KonfirmasiRegister> createState() => _KonfirmasiRegisterState();
}

class _KonfirmasiRegisterState extends State<KonfirmasiRegister> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5788,
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
                'Pendaftaran Berhasil',
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
                'Apakah anda ingin melanjutkan verifikasi identitas anda sekarang? Hal ini akan mempermudah anda ketika akan melakukan penyewaan gudang yang tersedia di dalam aplikasi',
                style: textApp.bodySmall
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
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
                      //         builder: (context) => const StartVerification()),
                      //     (route) => false);
                      Get.to(() => const StartVerification());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 24),
                      child: Text(
                        'Varifikasi Identitas',
                        style:
                            textApp.bodySmall.copyWith(color: colorApp.light1),
                      ),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: colorApp.secondaryColor),
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
                        'Lewati',
                        style: textApp.bodySmall
                            .copyWith(color: colorApp.secondaryColor),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
