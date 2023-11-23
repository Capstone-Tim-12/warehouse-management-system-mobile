import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';

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
                        controller: otpCont1,
                        textAlign: TextAlign.center,
                        decoration: fieldStyle.otpField,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 80,
                      width: 65,
                      child: TextField(
                        controller: otpCont2,
                        textAlign: TextAlign.center,
                        decoration: fieldStyle.otpField,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 80,
                      width: 65,
                      child: TextField(
                        controller: otpCont3,
                        textAlign: TextAlign.center,
                        decoration: fieldStyle.otpField,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 80,
                      width: 65,
                      child: TextField(
                        controller: otpCont4,
                        textAlign: TextAlign.center,
                        decoration: fieldStyle.otpField,
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
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'klik untuk mengirim ulang',
                        textAlign: TextAlign.start,
                        style: textApp.bodySmall.copyWith(
                            color: const Color(0xFF0063F7),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
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
                        widget.onEmailOTPPressed();
                      },
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
