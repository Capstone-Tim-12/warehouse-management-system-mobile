import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void bottomSheetFotoProfil(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.28,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  }, 
                  icon: Icon(
                    Icons.arrow_back, 
                    color: colorApp.secondaryColor,
                  ),
                ),
                Text(
                  'Photo Profile',
                  style: TextCollection().bodyNormal.copyWith(
                    color: colorApp.mainColor
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: colorApp.mainColor,
                        onPressed: () {}, 
                        icon: const Icon(Icons.camera_alt_sharp),
                      ),
                      const SizedBox(height: 8), 
                      Text(
                        'Kamera', 
                        style: TextCollection().heading7.copyWith(color: colorApp.mainColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: colorApp.mainColor,
                        onPressed: () {}, 
                        icon: const Icon(Icons.photo_outlined),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gallery', 
                        style: TextCollection().heading7.copyWith(color: colorApp.mainColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: colorApp.mainColor,
                        onPressed: () {}, 
                        icon: const Icon(Icons.person),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Avatar', 
                        style: TextCollection().heading7.copyWith(color: colorApp.mainColor),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
