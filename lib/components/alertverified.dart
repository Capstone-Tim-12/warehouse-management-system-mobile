import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void alertVerified(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: colorApp.light4,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Verifikasi Identitas',
              style: TextCollection().heading5.copyWith(
                    color: colorApp.mainColor,
                  ),
            ),
            // SizedBox(width: MediaQuery.of(context).size.width * 0.12),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.close),
              color: colorApp.mainColor,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/svg/icon_verified.svg',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const SizedBox(height: 18),
            Text(
              'Identitas Anda telah diverifikasi',
              style: TextCollection().heading7.copyWith(
                    color: colorApp.mainColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    },
  );
}
