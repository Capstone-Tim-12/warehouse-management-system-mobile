import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 160,
              height: 160,
              child: Icon(
                Icons.check,
                color: ColorApp().secondaryColor,
                size: 165,
              ),
            ),
            Text(
              "Terima Kasih",
              style: TextCollection().heading3,
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 100,
              width: 280,
              child: Text(
                "Anda telah berhasil melakukan pembayaran. Silahkan cek fitur 'My Warehouse' secara berkala.",
                style: TextCollection().bodyMedium,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorApp().secondaryColor),
                  onPressed: () {},
                  child: Text(
                    "Kembali",
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
