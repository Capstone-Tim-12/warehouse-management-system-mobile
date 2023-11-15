import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/payment/payment_screen_failed.dart';
import 'package:capstone_wms/screens/payment/payment_screen_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
      body: Padding(
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
                        "https://images.unsplash.com/photo-1622127922075-fb1d21fbacbf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D",
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
                        style: TextCollection()
                            .bodySmall
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "20.000.000/bulan",
                        style: TextCollection()
                            .bodySmall
                            .copyWith(fontWeight: FontWeight.normal),
                      )
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
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Kartu Kredit/Debit",
                        style: TextCollection().heading6,
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: SvgPicture.asset("assets/svg/debit_icon.svg"),
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

            // Container(
            //   height: 200,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: ColorApp().mainColor,
            //     borderRadius: BorderRadius.circular(8.0),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Text(
            //               "Qris",
            //               style: TextCollection().bodySmall.copyWith(
            //                     color: ColorApp().light4,
            //                     fontWeight: FontWeight.normal,
            //                   ),
            //             ),
            //             const Spacer(),
            //             Radio(
            //               activeColor: ColorApp().secondaryColor,
            //               fillColor: MaterialStateProperty.resolveWith<Color?>(
            //                   (states) => ColorApp().secondaryColor),
            //               value: "Qris",
            //               groupValue: selectedPaymentMethod,
            //               onChanged: (value) {
            //                 setState(() {
            //                   selectedPaymentMethod = value.toString();
            //                 });
            //               },
            //             ),
            //           ],
            //         ),
            //         const Divider(),
            //         Row(
            //           children: [
            //             Text(
            //               "Transfer Bank",
            //               style: TextCollection().bodySmall.copyWith(
            //                     color: ColorApp().light4,
            //                     fontWeight: FontWeight.normal,
            //                   ),
            //             ),
            //             const Spacer(),
            //             Radio(
            //               activeColor: ColorApp().secondaryColor,
            //               fillColor: MaterialStateProperty.resolveWith<Color?>(
            //                   (states) => ColorApp().secondaryColor),
            //               value: "Transfer Bank",
            //               groupValue: selectedPaymentMethod,
            //               onChanged: (value) {
            //                 setState(() {
            //                   selectedPaymentMethod = value as String?;
            //                 });
            //               },
            //             ),
            //           ],
            //         ),
            //         const Divider(),
            //         Row(
            //           children: [
            //             Text(
            //               "Kartu Kredit/Debit",
            //               style: TextCollection().bodySmall.copyWith(
            //                     color: ColorApp().light4,
            //                     fontWeight: FontWeight.normal,
            //                   ),
            //             ),
            //             const Spacer(),
            //             Radio(
            //               activeColor: ColorApp().secondaryColor,
            //               fillColor: MaterialStateProperty.resolveWith<Color?>(
            //                   (states) => ColorApp().secondaryColor),
            //               value: "Kartu Kredit/Debit",
            //               groupValue: selectedPaymentMethod,
            //               onChanged: (value) {
            //                 setState(() {
            //                   selectedPaymentMethod = value as String?;
            //                 });
            //               },
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 116,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorApp().mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextCollection().heading6.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    "Rp20.000.000",
                    style: TextCollection().heading6.copyWith(
                          color: ColorApp().secondaryColor,
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
                        builder: (context) => PaymentFailed(),
                      ),
                    );
                  },
                  child: Text(
                    "Lanjutkan Pembayaran",
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
