import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

void showBottomSheetBerhasil(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 23.5, right: 23.5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.28,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.check_circle_sharp,
                  color: colorApp.mainColor,
                ),
                const SizedBox(height: 24),
                Text(
                  'Email telah di verifikasi',
                  style: TextCollection().largeLabel.copyWith(color: colorApp.mainColor),
                ),
                const SizedBox(height: 24),
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
          ),
        );
      },
    );
  }