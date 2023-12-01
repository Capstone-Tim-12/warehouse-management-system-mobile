import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class VirtualAccountScreen extends StatefulWidget {
  const VirtualAccountScreen({Key? key}) : super(key: key);

  @override
  State<VirtualAccountScreen> createState() => _VirtualAccountScreenState();
}

class _VirtualAccountScreenState extends State<VirtualAccountScreen> {
  bool _isShowmBanking = true;
  bool _isShowiBanking = true;
  bool _isVisible = true;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                    "Rp300.000,00",
                    style: TextCollection().bodySmall.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Bayar Dalam",
                    style: TextCollection().bodySmall.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    "23 jam 15 menit 3 detik",
                    style: TextCollection().smallLabel.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 15),
              Text(
                "Nomor Virtual Account",
                style: TextCollection().bodySmall.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "123 23456 0000 222",
                    style: TextCollection().bodyMedium.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Salin",
                      style: TextCollection().smallLabel.copyWith(
                            color: ColorApp().secondaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Petunjuk Transfer mBanking",
                    style: TextCollection().bodySmall.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isShowmBanking = !_isShowmBanking;
                        _isShowiBanking = !_isShowiBanking;
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isShowmBanking
                        ? const Icon(Icons.keyboard_arrow_down)
                        : const Icon(Icons.keyboard_arrow_up),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Visibility(
                    visible: !_isShowmBanking,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: SizedBox(
                      width: double.infinity,
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
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Visibility(
                        visible: _isVisible,
                        child: Row(
                          children: [
                            Text(
                              "Petunjuk Transfer iBanking",
                              style: TextCollection().bodySmall.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isShowiBanking = !_isShowiBanking;
                                  // _isShowmBanking = !_isShowmBanking;
                                });
                              },
                              icon: _isShowiBanking
                                  ? const Icon(Icons.keyboard_arrow_down)
                                  : const Icon(Icons.keyboard_arrow_up),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          const SizedBox(height: 50),
                          Visibility(
                            visible: _isVisible && !_isShowiBanking,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: SizedBox(
                              width: double.infinity,
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      "1. Pilih i-Transfer > BCA Virtual Account\n",
                                  style: TextCollection().bodySmall.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        height: 2.0,
                                      ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text:
                                          "2. Masukkan nomor Virtual Account ",
                                    ),
                                    TextSpan(
                                      text: " 123 23456 0000 222\n",
                                      style: TextCollection()
                                          .smallLabel
                                          .copyWith(
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
                                      text:
                                          "4. Masukkan PIN i-BCA anda dan pilih OK",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
            onPressed: () {},
            child: Text(
              "OK",
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
