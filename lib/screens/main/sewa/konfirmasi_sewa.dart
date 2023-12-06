import 'dart:convert';

import 'package:capstone_wms/models/rentinfo_model.dart';
import 'package:capstone_wms/models/warehouse_model.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:capstone_wms/services/sewa_services.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KonfirmasiSewa extends StatefulWidget {
  KonfirmasiSewa(
      {super.key,
      required this.selectedWarehouse,
      required this.rentInformation});

  WarehouseModel selectedWarehouse;
  RentInfo rentInformation;

  @override
  State<KonfirmasiSewa> createState() => _KonfirmasiSewaState();
}

class _KonfirmasiSewaState extends State<KonfirmasiSewa> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  ApplicationServices applicationService = ApplicationServices();

  bool isLoading = false;
  Map<String, dynamic> userInfo = {};
  final formatter = NumberFormat("#,###");

  Future<void> getUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await applicationService.getUserInfo(prefs.getString('token')!);
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          userInfo = responseData['data'];
        });

        print(responseData);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengajuan Sewa',
          style: textApp.heading6,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: colorApp.secondaryColor,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: colorApp.mainColor,
                backgroundColor: colorApp.secondaryColor,
              ),
            )
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      Text(
                        'Detail Pemesanan',
                        style: textApp.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://media.istockphoto.com/id/1227641291/id/foto/tampilan-sudut-tinggi-gudang-yang-ditumpuk-dengan-kotak-dalam-ukuran-berbeda.jpg?s=1024x1024&w=is&k=20&c=e4JHyQcfhRt0sR-AH1CslMYFBLtkfmyvgmShLDIDqQ4=',
                                // Image.network(
                                //   'https://via.placeholder.com/142x160',
                                fit: BoxFit.fitHeight,
                                width: 142,
                                height: 160,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(widget.selectedWarehouse.name,
                                          // 'Gudang Kita Bersama',
                                          style: textApp.heading6),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        widget.selectedWarehouse.regencyName,
                                        // 'Jakarta Selatan',
                                        style: textApp.bodySmall.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(height: 8),
                                      if (widget
                                              .rentInformation.hitunganSewaId ==
                                          1)
                                        Text(
                                          "Rp.${formatter.format(widget.selectedWarehouse.weeklyPrice)}/Bulan",
                                          // 'Rp.20.000.000/bulan',
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      if (widget
                                              .rentInformation.hitunganSewaId ==
                                          2)
                                        Text(
                                          "Rp.${formatter.format(widget.selectedWarehouse.monthlyPrice)}/Bulan",
                                          // 'Rp.20.000.000/bulan',
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      if (widget
                                              .rentInformation.hitunganSewaId ==
                                          3)
                                        Text(
                                          "Rp.${formatter.format(widget.selectedWarehouse.annuallyPrice)}/Bulan",
                                          // 'Rp.20.000.000/bulan',
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Waktu Booking',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Ubah',
                                      style: textApp.bodySmall.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ))
                              ]),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tanggal Masuk',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  widget.rentInformation.entryDate,
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ]),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hitungan Sewa',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  widget.rentInformation.hitunganSewa,
                                  // 'Tahunan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ]),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Durasi Sewa',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                if (widget.rentInformation.hitunganSewaId == 1)
                                  Text(
                                    "${widget.rentInformation.durasiSewa} Minggu",
                                    style: textApp.bodySmall
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                if (widget.rentInformation.hitunganSewaId == 2)
                                  Text(
                                    "${widget.rentInformation.durasiSewa} Bulan",
                                    style: textApp.bodySmall
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                if (widget.rentInformation.hitunganSewaId == 3)
                                  Text(
                                    "${widget.rentInformation.durasiSewa} Tahun",
                                    style: textApp.bodySmall
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                              ]),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tanggal Keluar',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  widget.rentInformation.outDate,
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ]),
                          const SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Data Penyewa',
                              style: textApp.bodySmall
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nama Lengkap',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  userInfo['fullName'],
                                  //Osama bin Laden
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ]),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Email',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  userInfo['email'],
                                  // 'ladeenloveboom@gmail.com',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ]),
                          const SizedBox(
                            height: 12,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                //positioned
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: colorApp.mainColor,
                      // height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 22),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: textApp.heading6
                                        .copyWith(color: colorApp.light1),
                                  ),
                                  Text(
                                    "Rp.${formatter.format(widget.rentInformation.totalPrice)}",
                                    // 'Rp.20.000.000,00',
                                    style: textApp.heading6
                                        .copyWith(color: colorApp.light1),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            colorApp.secondaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => const KtpScanner()));
                                      // Navigator.of(context).pop();
                                    },
                                    child: Text('Ajukan Sewa',
                                        style: textApp.bodySmall.copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
    );
  }
}
