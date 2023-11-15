import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/ktpscan_screen.dart';
import 'package:flutter/material.dart';

class StartVerification extends StatefulWidget {
  const StartVerification({super.key});

  @override
  State<StartVerification> createState() => _StartVerificationState();
}

class _StartVerificationState extends State<StartVerification> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  String selectedRadioValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text(' '),
          ),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lengkapi verifikasi',
                    style: textApp.heading3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Lengkapi proses verifikasimu dalam 2 langkah mudah untuk melakukan penyewaan gudang',
                    style: textApp.bodyNormal.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RadioListTile(
                    value: 'KTP',
                    title: Text(
                      'Pakai KTP',
                      style: textApp.bodyNormal
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    groupValue: selectedRadioValue,
                    onChanged: (value) => setState(() {
                      selectedRadioValue = value.toString();
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.verified_user_rounded,
                        color: colorApp.secondaryColor,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          maxLines: 2,
                          'Data diri untuk memenuhi persyaratan dari Bank indonesia.',
                          style: textApp.bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              // height: 200,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorApp.mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const KtpScanner()));
                        },
                        child: Text('Verifikasi Sekarang',
                            style: textApp.largeLabel.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
