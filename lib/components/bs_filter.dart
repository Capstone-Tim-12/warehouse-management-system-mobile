import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetFilter extends StatefulWidget {
  const BottomSheetFilter({super.key, required this.onFilterPressed});

  final VoidCallback onFilterPressed;

  @override
  State<BottomSheetFilter> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  FindController cont = Get.put(FindController());
  TextCollection textapp = TextCollection();

  TextEditingController minPrice = TextEditingController();
  TextEditingController maxPrice = TextEditingController();
  TextEditingController minSize = TextEditingController();
  TextEditingController maxSize = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minPrice.text = cont.minPrice.value;
    maxPrice.text = cont.maxPrice.value;

    minSize.text = cont.minSize.value;
    maxSize.text = cont.maxSize.value;
  }

  @override
  Widget build(BuildContext context) {
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
                  // activeColor:
                  //     cont.recommended.value ? ColorApp().secondaryColor : null,
                  activeColor: ColorApp().secondaryColor,
                  title: Text(
                    "Paling Rekomendasi",
                    style: textapp.bodySmall.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  value: !cont.recommended.value ? true : false,
                  // value: cont.recommended.value,
                  groupValue: null,
                  onChanged: (value) {
                    cont.onRecommendedChange(value!);
                    print(cont.recommended.value);
                  },
                ),
                RadioListTile(
                  // activeColor:
                  //     cont.lowerPrice.value ? ColorApp().secondaryColor : null,
                  activeColor: ColorApp().secondaryColor,
                  title: Text(
                    "Harga Terendah",
                    style: textapp.bodySmall.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  value: !cont.lowerPrice.value ? true : false,
                  // value: cont.lowerPrice.value,
                  groupValue: null,
                  onChanged: (value) {
                    cont.onLowerPriceChange(value!);
                    print(cont.lowerPrice.value);
                  },
                ),
                RadioListTile(
                  // activeColor:
                  //     cont.higherPrice.value ? ColorApp().secondaryColor : null,
                  activeColor: ColorApp().secondaryColor,
                  title: Text(
                    "Harga Tertinggi",
                    style: textapp.bodySmall.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  value: !cont.higherPrice.value ? true : false,
                  // value: cont.higherPrice.value,
                  groupValue: null,
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
                        controller: minSize,
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
                        controller: maxSize,
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
                        controller: minPrice,
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
                        controller: maxPrice,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp().stateError,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    cont.resetFilter();
                    maxPrice.clear();
                    minPrice.clear();
                    maxSize.clear();
                    minSize.clear();
                  },
                  child: Text(
                    "Reset",
                    style: textapp.bodySmall.copyWith(
                      color: ColorApp().light4,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.65,
                  // width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorApp().mainColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      widget.onFilterPressed;
                      cont.clearWarehouseData();
                      cont.getWarehouseData();
                      // cont.resetFilter();
                    },
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
  }
}
