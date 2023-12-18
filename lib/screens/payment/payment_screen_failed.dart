import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

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
                  Color(0xffFFA2A2),
                  Color(0xffFF0000),
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
                    Icons.error,
                    color: ColorApp().light4,
                    size: 165,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 32,
                  width: 165,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: ColorApp().light4,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Maaf :(",
                    style: TextCollection().bodyNormal.copyWith(
                          color: ColorApp().stateError,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    "Pembayaran Gagal",
                    style: TextCollection().heading5.copyWith(
                          color: ColorApp().light4,
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
                          Text(
                            "Sepertinya ada sesuatu yang salah, pembayaran anda gagal untuk dilakukan",
                            style: TextCollection().bodySmall.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
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
                                backgroundColor: ColorApp().stateError,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Silahkan Coba Lagi",
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
