import 'dart:async';

import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/detailmywarehouse_cont.dart';
import 'package:capstone_wms/controllers/payment_controller.dart';
import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:capstone_wms/services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VirtualAccountScreen extends StatefulWidget {
  const VirtualAccountScreen({Key? key}) : super(key: key);

  @override
  State<VirtualAccountScreen> createState() => _VirtualAccountScreenState();
}

class _VirtualAccountScreenState extends State<VirtualAccountScreen> {
  late Timer _timer;
  Duration _duration = const Duration(hours: 24);
  PaymentController paymentCont = Get.put(PaymentController());
  DetailMyWarehouseController getIds = Get.put(DetailMyWarehouseController());
  final formatter = NumberFormat("#,###");
  DetailMyWarehouseController checkIsPaid =
      Get.put(DetailMyWarehouseController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
        });
      } else {
        _timer.cancel();
        // Timer completed, you can handle it here
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours jam $minutes menit $seconds detik';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pembayaran",
          style: TextCollection().heading6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ID Pembayaran",
                    style: TextCollection().bodySmall.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: paymentCont.xPaymentId.value));
                    },
                    child: Text(
                      paymentCont.xPaymentId.value,
                      style: TextCollection().bodySmall.copyWith(
                            color: ColorApp().secondaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Pembayaran",
                    style: TextCollection().bodySmall.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    'Rp. ${formatter.format(paymentCont.nominal.value)}',
                    style: TextCollection().bodySmall.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Row(
                children: [
                  Text(
                    "Bayar Dalam",
                    style: TextCollection().bodySmall.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    _formatDuration(_duration),
                    style: TextCollection().smallLabel.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Text(
                "Nomor Virtual Account",
                style: TextCollection().bodySmall.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Row(
                children: [
                  Text(
                    paymentCont.virtualAccountNumber.value,
                    style: TextCollection().bodyMedium.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text: paymentCont.virtualAccountNumber.value));

                      Get.snackbar("Nomor VA Disalin",
                          paymentCont.virtualAccountNumber.value);
                    },
                    child: Text(
                      "Salin",
                      style: TextCollection().smallLabel.copyWith(
                            color: ColorApp().secondaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  "Petunjuk Transfer mBanking",
                  style: TextCollection().bodySmall.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: RichText(
                      text: TextSpan(
                        text: "1. Pilih m-Transfer > BCA Virtual Account\n",
                        style: TextCollection().bodySmall.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              height: 2.0,
                            ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: "2. Masukkan nomor Virtual Account ",
                          ),
                          TextSpan(
                            text: " 123 23456 0000 222\n",
                            style: TextCollection().smallLabel.copyWith(
                                  color: ColorApp().secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const TextSpan(text: "dan pilih Send\n"),
                          const TextSpan(
                            text:
                                "3. Periksa informasi yang tertera di layar. Pastikan Merchant adalah Digihouse, dan total tagihan sudah Benar.\n",
                          ),
                          const TextSpan(
                            text: "4. Masukkan PIN m-BCA anda dan pilih OK",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  "Petunjuk Transfer iBanking",
                  style: TextCollection().bodySmall.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: RichText(
                      text: TextSpan(
                        text: "1. Pilih i-Transfer > BCA Virtual Account\n",
                        style: TextCollection().bodySmall.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              height: 2.0,
                            ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: "2. Masukkan nomor Virtual Account ",
                          ),
                          TextSpan(
                            text: " 123 23456 0000 222\n",
                            style: TextCollection().smallLabel.copyWith(
                                  color: ColorApp().secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const TextSpan(text: "dan pilih Send\n"),
                          const TextSpan(
                            text:
                                "3. Periksa informasi yang tertera di layar. Pastikan Merchant adalah Digihouse, dan total tagihan sudah Benar.\n",
                          ),
                          const TextSpan(
                            text: "4. Masukkan PIN i-BCA anda dan pilih OK",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height / 10.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorApp().mainColor,
        ),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp().secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              checkIsPaid.checkIsPaid(
                  getIds.idTransaksi.value, getIds.instalmentID.value);
              // Get.to(() => const MainScreen());
            },
            child: Text(
              "Cek Status Pembayaran",
              style: TextCollection().bodySmall.copyWith(
                    color: ColorApp().light4,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
