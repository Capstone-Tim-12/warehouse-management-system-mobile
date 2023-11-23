
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/constants/citizenship_collection.dart';
import 'package:capstone_wms/classes/constants/city_collection.dart';
import 'package:capstone_wms/classes/constants/gender_collection.dart';
import 'package:capstone_wms/classes/constants/job_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class EditIdentityProfile extends StatefulWidget {
  const EditIdentityProfile({super.key});

  @override
  State<EditIdentityProfile> createState() => _EditIdentityProfileState();
}

class _EditIdentityProfileState extends State<EditIdentityProfile> {
  ColorApp colorApp = ColorApp();
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
      appBar: AppBar(
        title: Text(
          'Kembali', style: textApp.heading5,
        ),
        backgroundColor: colorApp.dark4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 28, right: 20, bottom: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ubah data diri', 
                style: textApp.heading3.copyWith(fontSize: 27),
              ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      width: MediaQuery.of(context).size.width * 0.885,
                      height: MediaQuery.of(context).size.height * 0.038,
                      decoration: ShapeDecoration(
                        color: colorApp.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.020,
                            height: MediaQuery.of(context).size.height * 0.010,
                            decoration: ShapeDecoration(
                              color: colorApp.stateWarning,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Harap sesuaikan data diri anda dengan benar sesuai dengan keaslian data diri anda',
                              style: textApp.largeLabel.copyWith(color: colorApp.stateWarning, fontSize: 8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  'NIK',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 7,
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
                  height: 7,
                ),
                SizedBox(
                  height: 44,
                  child: TextField(
                    controller: nameCont,
                    decoration: fieldStyle.nikField,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Jenis Kelamin',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 48,
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
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Tempat Lahir',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 48,
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
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Tanggal Lahir',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 48,
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
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Pekerjaan',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 48,
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
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Kewarganegaraan',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 48,
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
                const SizedBox(height: 30),
                Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                              backgroundColor: colorApp.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            showBottomSheet(context);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const KtpScanner()));
                          },
                          child: Text('Ubah',
                              style: textApp.largeLabel.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ),
            ]
          ) 
            ),
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

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 23.5, right: 23.5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.check_circle_sharp,
                  color: colorApp.mainColor,
                ),
                const SizedBox(height: 24),
                Text(
                  'Verifikasi Identitas Berhasil',
                  style: textApp.largeLabel.copyWith(color: colorApp.mainColor),
                ),
                const SizedBox(height: 24),
                Text(
                  'Selamat! Anda telah berhasil melakukan verifikasi identitas. Sekarang Anda dapat menggunakan aplikasi ini dengan lebih leluasa.',
                  style: textApp.largeLabel.copyWith(
                    fontSize: 12,
                    color: colorApp.mainColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      backgroundColor: colorApp.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Kembali ke Halaman Settings',
                      style: textApp.largeLabelBlack.copyWith(
                        color: colorApp.light1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}