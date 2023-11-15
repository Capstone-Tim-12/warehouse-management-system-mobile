import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/constants/city_collection.dart';
import 'package:capstone_wms/classes/constants/country_collection.dart';
import 'package:capstone_wms/classes/constants/province_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  TextEditingController kecamatanCont = TextEditingController();
  TextEditingController alamatCont = TextEditingController();

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  // Gender gender = Gender();

  String selectedCountry = 'Indonesia';
  String selectedProvince = ' ';
  String selectedCity = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.bgAuthScaffold,
      appBar: AppBar(
        backgroundColor: colorApp.bgAuthScaffold,
        title: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: ShapeDecoration(
                color: colorApp.stateSuccess,
                shape: const OvalBorder(),
              ),
              child: Icon(
                Icons.check,
                color: colorApp.light1,
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              width: 12,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: const ShapeDecoration(
                color: Color(0xFF0063F7),
                shape: OvalBorder(),
              ),
              child: const Center(
                  child: Text(
                '2',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              'Cek Data',
              style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              // width: double.infinity,
              width: 125,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: ShapeDecoration(
                color: colorApp.light1,
                shape: const OvalBorder(),
              ),
              child: const Center(
                  child: Text(
                '3',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: paddingApp.scaffoldPadding,
            child: ListView(
              children: [
                Text(
                  'Ubah Alamat',
                  style: textApp.heading3.copyWith(fontSize: 27),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Alamat',
                      style: textApp.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Negara',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      style: fieldStyle.dropdownGender,
                      onPressed: () async {
                        // dropdownCities(context);
                        dropdownCitizenship(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCountry,
                            style: textApp.bodyNormal
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: colorApp.dark1,
                          )
                        ],
                      )),
                ),
                Text(
                  'Provinsi',
                  style: textApp.bodyMedium,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      style: fieldStyle.dropdownGender,
                      onPressed: () async {
                        // dropdownCities(context);
                        dropdownProvince(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedProvince,
                            style: textApp.bodyNormal
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: colorApp.dark1,
                          )
                        ],
                      )),
                ),
                Text(
                  'Kota/Kabupaten',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      style: fieldStyle.dropdownGender,
                      onPressed: () async {
                        // dropdownCities(context);
                        dropdownCities(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCity,
                            style: textApp.bodyNormal
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: colorApp.dark1,
                          )
                        ],
                      )),
                ),
                Text(
                  'Kecamatan',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: TextField(
                    controller: kecamatanCont,
                    decoration: fieldStyle.nikField,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                Text(
                  'Alamat Lengkap',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 109,
                  child: TextField(
                    maxLines: 9,
                    controller: alamatCont,
                    decoration: fieldStyle.nikField,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: colorApp.bgAuthScaffold,
                // height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 22),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorApp.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const KtpScanner()));
                            Navigator.of(context).pop();
                          },
                          child: Text('Ubah',
                              style: textApp.largeLabel.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void dropdownCitizenship(BuildContext context) {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            selectedCountry,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: Country.couintryList,
          selectedItems: (List<dynamic> selectedList) {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedCountry = (selectedList.first as SelectedListItem).name;
              });
              print(selectedCountry);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: false),
    ).showModal(context);
  }

  void dropdownProvince(BuildContext context) {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            selectedProvince,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: Provinsi.provinsiList,
          selectedItems: (List<dynamic> selectedList) {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedCountry = (selectedList.first as SelectedListItem).name;
              });
              print(selectedCountry);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: false),
    ).showModal(context);
  }

  void dropdownCities(BuildContext context) {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            selectedCity,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: Cities.cityList,
          selectedItems: (List<dynamic> selectedList) {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedCity = (selectedList.first as SelectedListItem).name;
              });
              print(selectedCity);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: false),
    ).showModal(context);
  }
}
