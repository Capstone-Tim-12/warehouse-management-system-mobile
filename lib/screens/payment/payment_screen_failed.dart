import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

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
                Icons.error,
                color: ColorApp().stateError,
                size: 165,
              ),
            ),
            Text(
              "Pembayaran Gagal",
              style: TextCollection().heading3,
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 100,
              width: 280,
              child: Text(
                "Pembayaran Anda gagal untuk dilakukan.",
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
