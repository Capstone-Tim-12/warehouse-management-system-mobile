import 'dart:convert';

import 'package:capstone_wms/models/pengajuan_model.dart';
import 'package:capstone_wms/models/rentinfo_model.dart';
import 'package:capstone_wms/models/warehouse_model.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:capstone_wms/screens/main/sewa/pengajuan_complete.dart';
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
  bool isApplicatonLoading = false;
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

  Future<void> postApplication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> formatdate = widget.rentInformation.entryDate.split('/');

    String dateEntry = formatdate[0];
    String monthEntry = formatdate[1];
    String yearEntry = formatdate[2];

    RentApplicationModel newRentApp = RentApplicationModel(
        token: prefs.getString('token')!,
        warehouseId: widget.selectedWarehouse.warehouseId,
        paymentSchemeId: widget.rentInformation.hitunganSewaId,
        duration: int.tryParse(widget.rentInformation.durasiSewa)!,
        dateEntry: "$yearEntry-$monthEntry-${dateEntry}T00:00:00.000+07:00");

    setState(() {
      isApplicatonLoading = true;
    });

    try {
      final response = await applicationService.rentApplication(newRentApp);

      final responseData = jsonDecode(response.body);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Get.to(() => PengajuanSelesai());
      } else {
        Get.snackbar(response.statusCode.toString(), responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isApplicatonLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInformation();
    print(widget.rentInformation.entryDate);
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
                              widget.selectedWarehouse.image != null &&
                                      Uri.parse(widget
                                              .selectedWarehouse.image?[0])
                                          .isAbsolute
                                  ? Image.network(
                                      // 'https://media.istockphoto.com/id/1227641291/id/foto/tampilan-sudut-tinggi-gudang-yang-ditumpuk-dengan-kotak-dalam-ukuran-berbeda.jpg?s=1024x1024&w=is&k=20&c=e4JHyQcfhRt0sR-AH1CslMYFBLtkfmyvgmShLDIDqQ4=',
                                      widget.selectedWarehouse.image?[0],
                                      // Image.network(
                                      //   'https://via.placeholder.com/142x160',
                                      fit: BoxFit.fitHeight,
                                      width: 142,
                                      height: 160, errorBuilder:
                                          (context, error, stackTrace) {
                                      return Image.network(
                                        "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                                        width: 142,
                                        height: 160,
                                        fit: BoxFit.fitHeight,
                                      );
                                    })
                                  : Image.network(
                                      "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                                      width: 142,
                                      height: 160,
                                      fit: BoxFit.fitHeight,
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
                              if (!isApplicatonLoading)
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
                                        postApplication();
                                      },
                                      child: Text('Ajukan Sewa',
                                          style: textApp.bodySmall.copyWith(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600))),
                                ),
                              if (isApplicatonLoading)
                                LinearProgressIndicator(
                                  color: colorApp.secondaryColor,
                                )
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
