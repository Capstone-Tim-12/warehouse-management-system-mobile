import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff455D7F),
                  Color(0xff102543),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 160,
                  child: Icon(
                    Icons.check,
                    color: ColorApp().light3,
                    size: 165,
                  ),
                ),
                Container(
                  height: 32,
                  width: 165,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: ColorApp().light3,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Terima Kasih !",
                    style: TextCollection().bodyNormal,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    "Pembayaran Telah Berhasil",
                    style: TextCollection().heading5.copyWith(
                          color: ColorApp().light3,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height / 4.2,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text:
                                  "Anda telah berhasil melakukan pembayaran, silahkan cek fitur '",
                              style: TextCollection().bodySmall.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'Gudangku',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "' secara berkala.",
                                  style: TextCollection().bodySmall.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor: ColorApp().mainColorDarker,
                              ),
                              onPressed: () {
                                Get.offAll(() => const MainScreen(),
                                    transition: Transition.upToDown);
                              },
                              child: Text(
                                "Kembali Ke Beranda",
                                style: TextCollection().bodySmall.copyWith(
                                      color: ColorApp().light4,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
