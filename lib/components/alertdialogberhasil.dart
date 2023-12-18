import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';


void alertDialogBerhasil(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: colorApp.light4,
        title: Icon(
          Icons.check_circle_sharp,
          color: colorApp.mainColor,
          size: 40,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text('Email telah di verifikasi',
            style: TextCollection().largeLabel.copyWith(color: colorApp.mainColor),
            ),
            const SizedBox(height: 18), 
            Text(
              'Selamat karena email Anda sudah terverifikasi, kini kami dapat mengirimkan aktivitas dan notifikasi Anda melalui email Anda', 
              style: TextCollection().largeLabelBlack.copyWith(
              fontSize: 12,
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
