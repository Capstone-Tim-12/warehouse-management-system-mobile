import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/payment/payment_screen_failed.dart';
import 'package:capstone_wms/screens/payment/payment_screen_success.dart';
import 'package:capstone_wms/screens/payment/payment_virtual_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool showCardTextField = false;
  TextEditingController cardController = TextEditingController();
  String? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_rounded),
          color: ColorApp().secondaryColor,
        ),
        title: Text(
          "Pembayaran",
          style: TextCollection().heading6,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Detail Pemesanan",
                style: TextCollection().bodySmall,
              ),
              const SizedBox(height: 10),
              Container(
                height: 105,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorApp().dark4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      height: 105,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(12),
                        ),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1590247813693-5541d1c609fd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Warehouse Kita",
                          style: TextCollection().heading6,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Jakarta Barat",
                          style: TextCollection().bodySmall.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "20.000.000/bulan",
                          style: TextCollection().bodySmall.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Metode Pembayaran",
                style: TextCollection().bodySmall,
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),

              // SizedBox(
              //   height: 70,
              //   width: double.infinity,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Kartu Kredit/Debit",
              //         style: TextCollection().heading6,
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text(
              //             showCardTextField
              //                 ? "Visa"
              //                 : selectedPaymentMethod ?? "Pilih Kartu",
              //             style: TextCollection().bodySmall,
              //           ),
              //           const Spacer(),
              //           IconButton(
              //             onPressed: () {
              //               setState(() {
              //                 showCardTextField = !showCardTextField;
              //               });
              //             },
              //             icon: const Icon(
              //               Icons.keyboard_arrow_down_rounded,
              //             ),
              //           ),
              //         ],
              //       ),
              //       if (showCardTextField)
              //         Container(
              //           width:
              //               200, // Set a specific width or use constraints as needed
              //           child: TextField(
              //             controller: cardController,
              //             decoration: InputDecoration(
              //               hintText: 'Masukkan nomor kartu',
              //               labelText: 'Nomor Kartu',
              //             ),
              //           ),
              //         ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 70,
              //   width: double.infinity,
              //   child: Visibility(
              //     visible:
              //         !showCardTextField, // Hide when the card text field is visible
              //     child: Row(
              //       children: [
              //         const SizedBox(height: 5),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "ATM/BANK transfer",
              //               style: TextCollection().heading6,
              //             ),
              //             SizedBox(
              //               width: 200,
              //               height: 35,
              //               child: SvgPicture.asset(
              //                 "assets/svg/bank_logo.svg",
              //                 fit: BoxFit.fill,
              //               ),
              //             )
              //           ],
              //         ),
              //         const Spacer(),
              //         IconButton(
              //           onPressed: () {},
              //           icon: const Icon(
              //             Icons.keyboard_arrow_down_rounded,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kartu Kredit/Debit",
                          style: TextCollection().heading6,
                        ),
                        Stack(
                          children: [
                            Visibility(
                              visible: !showCardTextField,
                              child: SizedBox(
                                width: 120,
                                height: 20,
                                child: SvgPicture.asset(
                                    "assets/svg/mastercard.svg"),
                              ),
                            ),
                            Visibility(
                              visible: showCardTextField,
                              child: Container(
                                width: 120,
                                height: 20,
                                child: TextField(
                                  controller: cardController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukkan nomor kartu',
                                    labelText: 'Nomor Kartu',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                        // Visibility(
                        //   visible: !showCardTextField,
                        //   child: SizedBox(
                        //     width: 120,
                        //     height: 20,
                        //     child: SvgPicture.asset(
                        //       "assets/svg/mastercard.svg",
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 120,
                        //   height: 20,
                        //   child: SvgPicture.asset("assets/svg/mastercard.svg"),
                        // )
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showCardTextField = !showCardTextField;
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ATM/BANK transfer",
                          style: TextCollection().heading6,
                        ),
                        SizedBox(
                          width: 200,
                          height: 35,
                          child: SvgPicture.asset(
                            "assets/svg/bank_logo.svg",
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Metode pembayaran lain",
                      style: TextCollection().heading6,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 6.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorApp().mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextCollection().heading6.copyWith(
                          color: ColorApp().light4,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    "Rp300.000,00",
                    style: TextCollection().heading6.copyWith(
                          color: ColorApp().light4,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Durasi Sewa",
                    style: TextCollection().smallLabel.copyWith(
                          color: ColorApp().light4,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    "3 Minggu",
                    style: TextCollection().smallLabel.copyWith(
                          color: ColorApp().light4,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: ColorApp().secondaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VirtualAccountScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Ajukan Sewa",
                    style: TextCollection()
                        .bodySmall
                        .copyWith(color: ColorApp().light4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
