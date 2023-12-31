import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/selfiektp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PanduanSelfieKTP extends StatelessWidget {
  PanduanSelfieKTP({super.key});

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorApp.bgAuthScaffold,
        appBar: AppBar(
          backgroundColor: colorApp.bgAuthScaffold,
          title: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  color: colorApp.stateSuccess,
                  shape: const OvalBorder(),
                ),
                child: Icon(
                  Icons.check,
                  color: colorApp.light1,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 12,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  color: colorApp.stateSuccess,
                  shape: const OvalBorder(),
                ),
                child: Icon(
                  Icons.check,
                  color: colorApp.light1,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              // const SizedBox(
              //   width: 2,
              // ),
              Container(
                // width: double.infinity,
                width: 125,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: const ShapeDecoration(
                  color: Color(0xFF0063F7),
                  shape: OvalBorder(),
                ),
                child: const Center(
                    child: Text(
                  '3',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
              ),
              Text(
                'Panduan',
                style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Panduan Selfie KTP',
                  style: textApp.heading3.copyWith(fontSize: 27),
                ),
                // const SizedBox(
                //   height: 17,
                // ),
                Text(
                  'Pastikan foto yang kamu ambil nanti sesuai dengan panduan dibawah ini.',
                  style:
                      textApp.bodyNormal.copyWith(fontWeight: FontWeight.w400),
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: colorApp.stateSuccess.withOpacity(0.15)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: ShapeDecoration(
                                      color: colorApp.stateSuccess,
                                      shape: const OvalBorder(),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: colorApp.light1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Benar',
                                      style: textApp.bodyNormal.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: colorApp.stateSuccess,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              SvgPicture.asset('assets/svg/panduanselktp.svg')
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: colorApp.stateError.withOpacity(0.15)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: ShapeDecoration(
                                      color: colorApp.stateError,
                                      shape: const OvalBorder(),
                                    ),
                                    child: Icon(
                                      Icons.clear_rounded,
                                      color: colorApp.light1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Salah',
                                      style: textApp.bodyNormal.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: colorApp.stateError,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              SvgPicture.asset(
                                  'assets/svg/panduanselktpsalah.svg')
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 37,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Pastikan HP secara tegak saat mengambil foto.',
                      style: textApp.bodySmall
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'KTP harus terlihat jelas',
                      style: textApp.bodySmall
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),

                const SizedBox(
                  width: 8,
                ),

                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        'Pastikan kamu berada ditempat bercahaya dan tidak menggunakan aksesoris dibagian wajah',
                        style: textApp.bodySmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //positioned

          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: colorApp.bgAuthScaffold,
                // height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 22),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorApp.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SelfieKTP()));
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
        ]));
  }
}
