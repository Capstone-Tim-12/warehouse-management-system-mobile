import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PengajuanSelesai extends StatelessWidget {
  PengajuanSelesai({super.key});
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 165,
                  width: 165,
                  child: Icon(
                    Icons.check,
                    color: colorApp.stateSuccess,
                    size: 150,
                  )),
              // SizedBox(
              //     height: 165,
              //     width: 165,
              //     child: SvgPicture.asset('assets/svg/arrowpengajuan.svg')),
              SizedBox(
                // width: 219,
                // width: 219,
                child: Text(
                  'Pengajuan Sewa Berhasil Dikirim',
                  style: textApp.heading5
                      .copyWith(fontSize: 20, color: colorApp.stateSuccess),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 308,
                child: Text(
                  'Silakan cek ‘My Warehouse’ secara berkala untuk cek status pengajuan sewa ',
                  style:
                      textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),

        //positioned
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: colorApp.mainColor,
              // height: 200,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorApp.secondaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Get.offAll(() => const MainScreen());
                            },
                            child: Text('Kembali ke Home',
                                style: textApp.bodySmall.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ],
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
