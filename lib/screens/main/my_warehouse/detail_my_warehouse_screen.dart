import 'dart:convert';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/controllers/chatbot_controller.dart';
import 'package:capstone_wms/controllers/detailmywarehouse_cont.dart';
import 'package:capstone_wms/screens/payment/payment_screen_main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/widget/warehouse_disewa_item.dart';
import 'package:intl/intl.dart';

class DetailMyWarehouseScreen extends StatefulWidget {
  // final Map<String, dynamic> warehouseData;
  final int warehouseId;
  final String transactionId;

  const DetailMyWarehouseScreen(
      {Key? key, required this.warehouseId, required this.transactionId})
      : super(key: key);

  @override
  State<DetailMyWarehouseScreen> createState() =>
      _DetailMyWarehouseScreenState();
}

class _DetailMyWarehouseScreenState extends State<DetailMyWarehouseScreen> {
  TextCollection textApp = TextCollection();
  DetailMyWarehouseController detailMyWarehouseCont =
      Get.put(DetailMyWarehouseController());
  ChatbotController chatbotCont = Get.put(ChatbotController());
  String entrydate = '';
  String outdate = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.warehouseId);

    print(widget.transactionId);
    // detailMyWarehouseCont.getWarehouseInfo(widget.warehouseId.toString());
    detailMyWarehouseCont.getWarehouseInfo(
        widget.warehouseId.toString(), widget.transactionId.toString());
    detailMyWarehouseCont.getTransactionInfo(widget.transactionId.toString());
    detailMyWarehouseCont.getInstalmentList(widget.transactionId.toString());
    String entry =
        detailMyWarehouseCont.transactionInfo['dateEntry'].toString();
    String out = detailMyWarehouseCont.transactionInfo['dateOut'].toString();

    List splitEntry = entry.split('T');
    List splitOut = out.split('T');

    setState(() {
      entrydate = splitEntry[0];
      outdate = splitOut[0];
    });
  }

  final formatter = NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    // String entry = detailMyWarehouseCont.transactionInfo['dateEntry'].toString().split('T');

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: colorApp.secondaryColor,
              )),
          title: Text(
            'Kontrak & Tagihan',
            style: textApp.heading6,
          ),
        ),
        body: Obx(() => detailMyWarehouseCont.isLoading.value ||
                detailMyWarehouseCont.isTranInfoLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: colorApp.mainColor,
                  backgroundColor: colorApp.secondaryColor,
                ),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  detailMyWarehouseCont
                                                  .warehouseInfo['image'] !=
                                              null &&
                                          Uri.parse(detailMyWarehouseCont
                                                  .warehouseInfo['image'])
                                              .isAbsolute
                                      ? Obx(() => Image.network(
                                            detailMyWarehouseCont
                                                .warehouseInfo['image'],
                                            width: 142,
                                            height: 227,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.network(
                                                "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                                width: 142,
                                                height: 227,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ))
                                      : Image.network(
                                          "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          width: 142,
                                          height: 227,
                                          fit: BoxFit.cover,
                                        ),
                                  // Image.network(
                                  //   'https://media.istockphoto.com/id/1227641291/id/foto/tampilan-sudut-tinggi-gudang-yang-ditumpuk-dengan-kotak-dalam-ukuran-berbeda.jpg?s=1024x1024&w=is&k=20&c=e4JHyQcfhRt0sR-AH1CslMYFBLtkfmyvgmShLDIDqQ4=',
                                  //   // Image.network(
                                  //   //   'https://via.placeholder.com/142x160',
                                  //   fit: BoxFit.fitHeight,
                                  //   width: 142,
                                  //   height: 160,
                                  // ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Obx(
                                            () => Text(
                                                detailMyWarehouseCont
                                                    .warehouseInfo['name']
                                                    .toString(),
                                                style: textApp.heading6),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            detailMyWarehouseCont
                                                .warehouseInfo['regencyName']
                                                .toString(),
                                            style: textApp.bodySmall.copyWith(
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Rp.${formatter.format(detailMyWarehouseCont.warehouseInfo['annualPrice'])}/Tahun",
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
                            height: 12,
                          ),

                          Text(
                            'Kontrak',
                            style: textApp.bodySmall,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tanggal Masuk',
                                        style: textApp.bodySmall.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        // detailMyWarehouseCont
                                        //     .transactionInfo['dateEntry']
                                        //     .toString(),
                                        detailMyWarehouseCont
                                            .transactionInfo['dateEntry'],
                                        style: textApp.bodySmall.copyWith(
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Hitungan Sewa',
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400)),
                                      Text(
                                          detailMyWarehouseCont
                                              .transactionInfo['paymentScheme']
                                              .toString(),
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Durasi Sewa',
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400)),
                                      if (detailMyWarehouseCont.transactionInfo[
                                              'paymentScheme'] ==
                                          'mingguan')
                                        Text(
                                            '${detailMyWarehouseCont.transactionInfo['duration']} minggu',
                                            style: textApp.bodySmall.copyWith(
                                                fontWeight: FontWeight.w400)),
                                      if (detailMyWarehouseCont.transactionInfo[
                                              'paymentScheme'] ==
                                          'bulanan')
                                        Text(
                                            '${detailMyWarehouseCont.transactionInfo['duration']} bulan',
                                            style: textApp.bodySmall.copyWith(
                                                fontWeight: FontWeight.w400)),
                                      if (detailMyWarehouseCont.transactionInfo[
                                              'paymentScheme'] ==
                                          'tahunan')
                                        Text(
                                            '${detailMyWarehouseCont.transactionInfo['duration']} tahun',
                                            style: textApp.bodySmall.copyWith(
                                                fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Tanggal Keluar',
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400)),
                                      Text(
                                          // detailMyWarehouseCont
                                          //     .transactionInfo['dateOut']
                                          //     .toString(),
                                          detailMyWarehouseCont
                                              .transactionInfo['dateOut']
                                              .toString(),
                                          style: textApp.bodySmall.copyWith(
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 32),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Detail Kontrak',
                                                      style: textApp.bodySmall2,
                                                    ),
                                                    const SizedBox(height: 24),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Tanggal Masuk',
                                                          style: textApp
                                                              .bodySmall
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                        Text(
                                                            detailMyWarehouseCont
                                                                    .transactionInfo[
                                                                'dateEntry'],
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Hitungan Sewa',
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                        Text(
                                                            detailMyWarehouseCont
                                                                .transactionInfo[
                                                                    'paymentScheme']
                                                                .toString(),
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Durasi Sewa',
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                        if (detailMyWarehouseCont
                                                                    .transactionInfo[
                                                                'paymentScheme'] ==
                                                            'mingguan')
                                                          Text(
                                                              "${detailMyWarehouseCont.transactionInfo['duration']} minggu",
                                                              style: textApp
                                                                  .bodySmall
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                        if (detailMyWarehouseCont
                                                                    .transactionInfo[
                                                                'paymentScheme'] ==
                                                            'tahunan')
                                                          Text(
                                                              "${detailMyWarehouseCont.transactionInfo['duration']} tahun",
                                                              style: textApp
                                                                  .bodySmall
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                        if (detailMyWarehouseCont
                                                                    .transactionInfo[
                                                                'paymentScheme'] ==
                                                            'bulanan')
                                                          Text(
                                                              "${detailMyWarehouseCont.transactionInfo['duration']} bulan",
                                                              style: textApp
                                                                  .bodySmall
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Tanggal Keluar',
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                        Text(
                                                            detailMyWarehouseCont
                                                                .transactionInfo[
                                                                    'dateEntry']
                                                                .toString(),
                                                            // outdate,
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 24),
                                                    Text(
                                                      'Data Penyewa',
                                                      style: textApp.bodySmall2,
                                                    ),
                                                    const SizedBox(height: 24),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Nama Lengkap',
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                        Text(
                                                            chatbotCont
                                                                    .userInfo[
                                                                'fullName'],
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Email',
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                        Text(
                                                            chatbotCont
                                                                    .userInfo[
                                                                'email'],
                                                            style: textApp
                                                                .bodySmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 12),
                                                    // Row(
                                                    //   mainAxisAlignment:
                                                    //       MainAxisAlignment
                                                    //           .spaceBetween,
                                                    //   children: [
                                                    //     Text('No. Telp',
                                                    //         style: textApp
                                                    //             .bodySmall
                                                    //             .copyWith(
                                                    //                 fontWeight:
                                                    //                     FontWeight
                                                    //                         .w400)),
                                                    //     Text('008656',
                                                    //         style: textApp
                                                    //             .bodySmall
                                                    //             .copyWith(
                                                    //                 fontWeight:
                                                    //                     FontWeight
                                                    //                         .w400)),
                                                    //   ],
                                                    // ),
                                                    const SizedBox(height: 24),
                                                    Text(
                                                      'Aturan Denda',
                                                      style: textApp.bodySmall2,
                                                    ),
                                                    const SizedBox(
                                                      height: 24,
                                                    ),
                                                    Text(
                                                        'Denda diberlakukan jika penyewa membayar tagihan gudang melewati 14 hari dari tanggal tagihan, nominal denda adalah Rp.40.000.000',
                                                        style: textApp.bodySmall
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Text('Selengkapnya',
                                      style:
                                          TextStyle(color: colorApp.stateInfo)),
                                )
                              ]),
                          // const SizedBox(height: 16),
                          // AKAN DATANG
                          Text(
                            'Akan Datang',
                            style: textApp.bodySmall,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(() => FutureBuilder<List<dynamic>?>(
                              future: detailMyWarehouseCont
                                      .instalmentList.isNotEmpty
                                  ? Future.value(
                                      detailMyWarehouseCont.instalmentList)
                                  : null,
                              builder: (context, snapshot) {
                                if (detailMyWarehouseCont
                                    .isInstallmentLoading.value) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: colorApp.mainColor,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (snapshot.data == null ||
                                    detailMyWarehouseCont
                                        .instalmentList.isEmpty) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    child: Center(
                                      child: Text(
                                        "Belum Ada Tagihan",
                                        style: textApp.bodySmall.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    child: ListView.builder(
                                        itemCount: detailMyWarehouseCont
                                            .instalmentList.length,
                                        itemBuilder: (context, index) {
                                          var bill = detailMyWarehouseCont
                                              .instalmentList[index];
                                          return Container(
                                            // elevation: 4,
                                            decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Color(0x0F000000),
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                    spreadRadius: 0,
                                                  ),
                                                  BoxShadow(
                                                    color: Color(0x0A000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 0,
                                                  )
                                                ]),
                                            // color: Colors.white,
                                            child: Column(children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: colorApp.mainColor,
                                                ),
                                                width: double.infinity,
                                                height: 30,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '',
                                                        style: textApp.bodySmall
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      Text(
                                                          bill['status']
                                                              .toString(),
                                                          style: textApp
                                                              .bodySmall
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Jumlah Tagihan',
                                                      style: textApp.bodySmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    Text(
                                                      'Rp. ${formatter.format(bill['nominal'])}',
                                                      // 'Rp 50.000.000',
                                                      style: textApp.bodySmall,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      bill['dueDate'],
                                                      // '1 Agustus 2023',
                                                      style: textApp.bodySmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    SizedBox(
                                                      width: 90,
                                                      height: 29,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          int billId = bill[
                                                              'instalmentId'];
                                                          print(billId);

                                                          detailMyWarehouseCont
                                                              .setTransInstalID(
                                                                  widget
                                                                      .transactionId,
                                                                  billId);

                                                          Get.to(PaymentScreen(
                                                            total:
                                                                bill['nominal'],
                                                            durasi: detailMyWarehouseCont
                                                                    .transactionInfo[
                                                                'duration'],
                                                            satuan: detailMyWarehouseCont
                                                                    .transactionInfo[
                                                                'paymentScheme'],
                                                            installmentId:
                                                                billId,
                                                            warehouseId: widget
                                                                .warehouseId,
                                                          ));
                                                          // PaymentScreen(paymentMethodId: 1, installmentId: billId, bankCode: 'BCA',));
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          // primary: colorApp.secondaryColor,
                                                          backgroundColor:
                                                              colorApp
                                                                  .secondaryColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      15,
                                                                  vertical: 2),
                                                        ),
                                                        child: Text(
                                                          'Bayar',
                                                          style: textApp
                                                              .bodySmall
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                            ]),
                                          );
                                        }),
                                  );
                                }
                              })),
                          const SizedBox(height: 16),
                          // LUNAS
                          Text(
                            'Lunas',
                            style: textApp.bodySmall,
                          ),
                          const SizedBox(height: 16),
                          Obx(() => FutureBuilder<List<dynamic>?>(
                              future: detailMyWarehouseCont
                                      .paidInstalmentList.isNotEmpty
                                  ? Future.value(
                                      detailMyWarehouseCont.paidInstalmentList)
                                  : null,
                              builder: (context, snapshot) {
                                if (detailMyWarehouseCont
                                    .isInstallmentLoading.value) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: colorApp.mainColor,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (snapshot.data == null ||
                                    detailMyWarehouseCont
                                        .paidInstalmentList.isEmpty) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    child: Center(
                                      child: Text(
                                        "Belum Ada Tagihan",
                                        style: textApp.bodySmall.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    child: ListView.builder(
                                        itemCount: detailMyWarehouseCont
                                            .paidInstalmentList.length,
                                        itemBuilder: (context, index) {
                                          var bill = detailMyWarehouseCont
                                              .paidInstalmentList[index];
                                          return Container(
                                            // elevation: 4,
                                            decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Color(0x0F000000),
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                    spreadRadius: 0,
                                                  ),
                                                  BoxShadow(
                                                    color: Color(0x0A000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 0,
                                                  )
                                                ]),
                                            // color: Colors.white,
                                            child: Column(children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: colorApp.mainColor,
                                                ),
                                                width: double.infinity,
                                                height: 30,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '',
                                                        style: textApp.bodySmall
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      Text(
                                                          bill['status']
                                                              .toString(),
                                                          style: textApp
                                                              .bodySmall
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Jumlah Tagihan',
                                                      style: textApp.bodySmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    Text(
                                                      "Rp. ${formatter.format(bill['nominal'])}",
                                                      // 'Rp 50.000.000',
                                                      style: textApp.bodySmall,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      bill['dueDate'],
                                                      // '1 Agustus 2023',
                                                      style: textApp.bodySmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    SizedBox(
                                                      width: 90,
                                                      height: 29,
                                                      child: ElevatedButton(
                                                        onPressed: null,
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          // primary: colorApp.secondaryColor,
                                                          disabledBackgroundColor:
                                                              colorApp
                                                                  .secondaryColorLighter,
                                                          backgroundColor:
                                                              colorApp
                                                                  .secondaryColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      15,
                                                                  vertical: 2),
                                                        ),
                                                        child: Text(
                                                          'Bayar',
                                                          style: textApp
                                                              .bodySmall
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                            ]),
                                          );
                                        }),
                                  );
                                }
                              })),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.149,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: colorApp.mainColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.056,
                            vertical: 12),
                        child: Column(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: colorApp.secondaryColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Berhenti Sewa',
                                    style: textApp.bodySmall.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorApp.secondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text('Lanjut Sewa',
                                      style: textApp.bodySmall.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )));
  }
}
