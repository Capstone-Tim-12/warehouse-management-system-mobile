import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/search_controller.dart';
import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> filterBottomSheet(BuildContext context) {
  FindController cont = Get.put(FindController());
  TextCollection textapp = TextCollection();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorApp().light4,
    builder: (builder) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.909,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list_rounded,
                          color: ColorApp().dark1,
                        ),
                        const SizedBox(width: 20),
                        Text("Filter", style: textapp.bodySmall)
                      ],
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Urutkan", style: textapp.bodyNormal),
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      RadioListTile(
                        activeColor: ColorApp().secondaryColor,
                        title: Text(
                          "Paling Rekomendasi",
                          style: textapp.bodySmall.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        value: true,
                        groupValue: cont.recommended.value,
                        onChanged: (value) {
                          cont.onRecommendedChange(value!);
                          print(cont.recommended.value);
                        },
                      ),
                      RadioListTile(
                        activeColor: ColorApp().secondaryColor,
                        title: Text(
                          "Harga Terendah",
                          style: textapp.bodySmall.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        value: true,
                        groupValue: cont.lowerPrice.value,
                        onChanged: (value) {
                          cont.onLowerPriceChange(value!);
                          print(cont.lowerPrice.value);
                        },
                      ),
                      RadioListTile(
                        activeColor: ColorApp().secondaryColor,
                        title: Text(
                          "Harga Tertinggi",
                          style: textapp.bodySmall.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        value: true,
                        groupValue: cont.higherPrice.value,
                        onChanged: (value) {
                          cont.onHigherPriceChange(value!);
                          print(cont.higherPrice.value);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Ukuran Warehouse",
                    style: textapp.bodyNormal,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  cont.minSize.value = value;
                                }
                              },
                              textAlign: TextAlign.start,
                              cursorColor: ColorApp().mainColor,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                                hintText: "Minimal",
                                hintStyle: textapp.smallLabel.copyWith(
                                  color: ColorApp().dark1,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  bottom: 5.0,
                                  left: 10.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Min.",
                            style: textapp.extraSmallLabel.copyWith(
                              color: ColorApp().dark1,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  cont.maxSize.value = value;
                                }
                              },
                              textAlign: TextAlign.end,
                              cursorColor: ColorApp().mainColor,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                                hintText: "Maksimal",
                                hintStyle: textapp.smallLabel.copyWith(
                                  color: ColorApp().dark1,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  bottom: 5.0,
                                  right: 10.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Max.",
                            style: textapp.extraSmallLabel.copyWith(
                              color: ColorApp().dark1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Harga", style: textapp.bodyNormal),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  cont.minPrice.value = value;
                                }
                              },
                              textAlign: TextAlign.start,
                              cursorColor: ColorApp().mainColor,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                                hintText: "Minimal",
                                hintStyle: textapp.smallLabel.copyWith(
                                  color: ColorApp().dark1,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  bottom: 5.0,
                                  left: 10.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Min.",
                            style: textapp.extraSmallLabel.copyWith(
                              color: ColorApp().dark1,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  cont.maxPrice.value = value;
                                }
                              },
                              textAlign: TextAlign.end,
                              cursorColor: ColorApp().mainColor,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                                hintText: "Maksimal",
                                hintStyle: textapp.smallLabel.copyWith(
                                  color: ColorApp().dark1,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  bottom: 5.0,
                                  right: 10.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: ColorApp().mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Max.",
                            style: textapp.extraSmallLabel.copyWith(
                              color: ColorApp().dark1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp().stateError,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Delete",
                          style: textapp.bodySmall.copyWith(
                            color: ColorApp().light4,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorApp().mainColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Search",
                            style: textapp.bodySmall.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}
