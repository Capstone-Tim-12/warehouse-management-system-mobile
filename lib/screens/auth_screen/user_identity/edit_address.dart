import 'dart:convert';

import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/constants/city_collection.dart';
import 'package:capstone_wms/classes/constants/country_collection.dart';
import 'package:capstone_wms/classes/constants/province_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/address_controller.dart';
import 'package:capstone_wms/controllers/district_controller.dart';
import 'package:capstone_wms/controllers/province_controller.dart';
import 'package:capstone_wms/controllers/regency_controller.dart';
import 'package:capstone_wms/models/address_model.dart';
import 'package:capstone_wms/models/locationapi_model.dart';
import 'package:capstone_wms/services/location_service.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  TextEditingController kecamatanCont = TextEditingController();
  TextEditingController alamatCont = TextEditingController();
  RegencyController getRegencyList = Get.put(RegencyController());
  ProvinceController getProvinceList = Get.put(ProvinceController());
  DistrictController getDistrictList = Get.put(DistrictController());

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  bool isLoading = false;
  bool isProvinceSelected = false;
  bool isRegencySelected = false;
  LocationService getLocationFunc = Get.put(LocationService());
  AddressController verUserAddress = Get.put(AddressController());

  Future<void> getRegency() async {
    setState(() {
      isProvinceSelected = true;
    });
    final reponseRegency =
        await getLocationFunc.getRegencyList(selectedProvinceId.toString());

    // print(reponseRegency.body);
    print(reponseRegency.statusCode);

    final regencyData = await json.decode(reponseRegency.body);
    // print(regencyData);
    // setState(() {
    //   isLoading = false;
    // });
    if (reponseRegency.statusCode == 200) {
      List<LocationCollectionModel> parseRegencies =
          getRegencyList.parseCityList(regencyData);

      setState(() {
        getRegencyList.setRegencyList(parseRegencies);
        regencyList = convertToSelectedList(getRegencyList.regencyList);
      });

      // print(getRegencyFunc.regencyList.toList());
    } else {
      Get.snackbar("Error", regencyData["message"]);
    }
  }

  Future<void> getDistrict() async {
    // setState(() {

    // });
    final reponseDistrict =
        await getLocationFunc.getDistrictList(selectedCityId.toString());

    print('get district : ${reponseDistrict.statusCode}');

    final districtData = await json.decode(reponseDistrict.body);

    if (reponseDistrict.statusCode == 200) {
      List<LocationCollectionModel> parseDistrict =
          getDistrictList.parseDistrictList(districtData);

      setState(() {
        getDistrictList.setDistrictList(parseDistrict);
        districtList = convertToSelectedList(getDistrictList.districtList);
      });
    } else {
      Get.snackbar("Error", districtData["message"]);
    }
  }

  String selectedCountry = 'Indonesia';
  String selectedProvince = '';
  int selectedProvinceId = 0;
  String selectedCity = '';
  int selectedCityId = 0;
  String selectedDistrict = '';
  int selectedDistrictId = 0;
  List<SelectedListItem> regencyList = [];
  List<SelectedListItem> provinceList = [];
  List<SelectedListItem> districtList = [];

  List<SelectedListItem> convertToSelectedList(
      List<LocationCollectionModel> cities) {
    return cities.map((city) {
      return SelectedListItem(name: city.name, value: city.id);
    }).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    regencyList = convertToSelectedList(getRegencyList.regencyList);
    provinceList = convertToSelectedList(getProvinceList.provinceList);
    districtList = convertToSelectedList(getDistrictList.districtList);

    selectedProvince = verUserAddress.userAddress.value.province;
    selectedProvinceId = verUserAddress.userAddress.value.provinceId;
    selectedCity = verUserAddress.userAddress.value.regency;
    selectedCityId = verUserAddress.userAddress.value.regencyId;
    selectedDistrict = verUserAddress.userAddress.value.district;
    selectedDistrictId = verUserAddress.userAddress.value.districtId;
    alamatCont.text = verUserAddress.userAddress.value.fullAdress;
  }

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
                      // onPressed: () async {
                      //   // dropdownCities(context);
                      //   // dropdownCitizenship(context);

                      // },
                      onPressed: null,
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
                          Expanded(
                            child: Text(
                              selectedCity,
                              style: textApp.bodyNormal
                                  .copyWith(fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                            ),
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
                  child: ElevatedButton(
                      style: fieldStyle.dropdownGender,
                      onPressed: () async {
                        // dropdownCities(context);
                        dropdownDistrict(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDistrict,
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
                const SizedBox(
                  height: 148,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: colorApp.bgAuthScaffold,
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorApp.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    AddressModel newVerUser = AddressModel(
                        country: selectedCountry,
                        province: selectedProvince,
                        provinceId: selectedProvinceId,
                        regency: selectedCity,
                        regencyId: selectedCityId,
                        district: selectedDistrict,
                        districtId: selectedDistrictId,
                        fullAdress: alamatCont.text);

                    verUserAddress.updateUserAddress(newVerUser);

                    Get.back();
                  },
                  child: Text('Ubah',
                      style: textApp.largeLabel.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))),
            ),
          ),
        ),
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
            overflow: TextOverflow.ellipsis,
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
          data: provinceList,
          selectedItems: (List<dynamic> selectedList) async {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedProvince =
                    (selectedList.first as SelectedListItem).name;
                selectedProvinceId =
                    int.parse((selectedList.first as SelectedListItem).value!);

                selectedCity = '';
                selectedCityId = 0;
                selectedDistrict = '';
                selectedDistrictId = 0;
              });
              await getRegency();
              print(selectedProvince);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: true),
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
          data: regencyList,
          selectedItems: (List<dynamic> selectedList) async {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedCity = (selectedList.first as SelectedListItem).name;
                selectedCityId =
                    int.parse((selectedList.first as SelectedListItem).value!);
              });
              await getDistrict();
              print(selectedCityId);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: true),
    ).showModal(context);
  }

  void dropdownDistrict(BuildContext context) {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            selectedDistrict,
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
          data: districtList,
          selectedItems: (List<dynamic> selectedList) {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedDistrict =
                    (selectedList.first as SelectedListItem).name;
                selectedDistrictId =
                    int.parse((selectedList.first as SelectedListItem).value!);
              });
              print(selectedDistrictId);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: true),
    ).showModal(context);
  }
}
