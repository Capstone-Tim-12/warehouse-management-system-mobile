import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';


void alertDialogGagal(BuildContext context) {
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
          Icons.cancel_outlined,
          color: colorApp.mainColor,
          size: 40,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text('Maaf, email tidak dapat di verifikasi',
            // overflow: TextOverflow.ellipsis,
            style: TextCollection().largeLabel.copyWith(color: colorApp.mainColor),
            ),
            const SizedBox(height: 18),
            Text(
              'Anda telah membatalkan atau terdapat kesalahan pada saat memasukkan email, mohon untuk di periksa sebelum memasukkan email', 
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
