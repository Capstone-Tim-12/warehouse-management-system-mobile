import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/constants/citizenship_collection.dart';
import 'package:capstone_wms/classes/constants/city_collection.dart';
import 'package:capstone_wms/classes/constants/gender_collection.dart';
import 'package:capstone_wms/classes/constants/job_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class EditIdentity extends StatefulWidget {
  const EditIdentity({super.key});

  @override
  State<EditIdentity> createState() => _EditIdentityState();
}

class _EditIdentityState extends State<EditIdentity> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  Gender gender = Gender();

  String selectedGender = 'Laki-Laki';
  String selectedCity = 'Jakarta';
  String selectedJobs = 'Karyawan Swasta';
  String selectedCitizenship = 'WNI';

  String selectedDay = '11';
  String selectedMonth = '9';
  String selectedYear = '2001';
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();

  //controller
  TextEditingController nikCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String date = selectedDate.day.toString();
    String month = selectedDate.month.toString();
    String year = selectedDate.year.toString();

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
                  'Ubah Data Diri',
                  style: textApp.heading3.copyWith(fontSize: 27),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Data Diri',
                      style: textApp.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'NIK',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: TextField(
                    controller: nikCont,
                    decoration: fieldStyle.nikField,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                Text(
                  'Nama Lengkap',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: TextField(
                    controller: nikCont,
                    decoration: fieldStyle.nikField,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                // const SizedBox(
                //   height: 4,
                // ),
                Text(
                  'Jenis Kelamin',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      style: fieldStyle.dropdownGender,
                      onPressed: () {
                        dropdownGender(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedGender,
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
                  'Tempat Lahir',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      style: fieldStyle.dropdownGender,
                      onPressed: () {
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
                  'Tanggal Lahir',
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
                        final selectDate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(1890),
                            lastDate: DateTime(now.year + 100));

                        setState(() {
                          if (selectDate != null) {
                            selectedDate = selectDate;
                            print(selectedDate.day);
                            print(selectedDate.month);
                            print(selectedDate.year);
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$date-$month-$year',
                            style: textApp.bodyNormal
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: colorApp.dark1,
                          )
                        ],
                      )),
                ),
                Text(
                  'Pekerjaan',
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
                        dropdownJobs(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedJobs,
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
                  'Kewarganegaraan',
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
                            selectedCitizenship,
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

  void dropdownGender(BuildContext context) {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            selectedGender,
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
          data: Gender.genderList,
          selectedItems: (List<dynamic> selectedList) {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedGender = (selectedList.first as SelectedListItem).name;
              });
              print(selectedGender);
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
          isSearchVisible: true),
    ).showModal(context);
  }

  void dropdownJobs(BuildContext context) {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            selectedJobs,
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
          data: Jobs.jobList,
          selectedItems: (List<dynamic> selectedList) {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedJobs = (selectedList.first as SelectedListItem).name;
              });
              print(selectedJobs);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: true),
    ).showModal(context);
  }

  void dropdownCitizenship(BuildContext context) {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            selectedCitizenship,
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
          data: Citizenship.citizenshipList,
          selectedItems: (List<dynamic> selectedList) {
            if (selectedList.isNotEmpty &&
                selectedList.first is SelectedListItem) {
              setState(() {
                selectedCitizenship =
                    (selectedList.first as SelectedListItem).name;
              });
              print(selectedCitizenship);
            }
          },
          enableMultipleSelection: false,
          // searchBoxStyle: null,
          isSearchVisible: false),
    ).showModal(context);
  }
}
