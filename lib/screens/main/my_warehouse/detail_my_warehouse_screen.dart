import 'dart:convert';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:http/http.dart' as http;
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/widget/warehouse_disewa_item.dart';

class DetailMyWarehouseScreen extends StatefulWidget {
  final Map<String, dynamic> warehouseData;

  const DetailMyWarehouseScreen({Key? key, required this.warehouseData})
      : super(key: key);

  @override
  State<DetailMyWarehouseScreen> createState() =>
      _DetailMyWarehouseScreenState();
}

class _DetailMyWarehouseScreenState extends State<DetailMyWarehouseScreen> {
  TextCollection textApp = TextCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Warehouse Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WarehouseItem(item: widget.warehouseData),

                // KONTRAK
                Text(
                  'Kontrak',
                  style: textApp.bodySmall,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Masuk'),
                        Text('1 Agustus 2023'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hitungan Sewa'),
                        Text('Mingguan'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Durasi Sewa'),
                        Text('3 Minggu'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Keluar'),
                        Text('13 Agustus 2023'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 32),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Detail Kontrak',
                                        style: textApp.bodySmall2,
                                      ),
                                      SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tanggal Masuk'),
                                          Text('1 Agustus 2023'),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Hitungan Sewa'),
                                          Text('Mingguan')
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Durasi Sewa'),
                                          Text('3 Minggu')
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tanggal Keluar'),
                                          Text('21 Agustus 2023')
                                        ],
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Data Penyewa',
                                        style: textApp.bodySmall2,
                                      ),
                                      SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Nama Lengkap'),
                                          Text('Budiawan')
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Email'),
                                          Text('budi@gmail.com'),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('No. Telp'),
                                          Text('008656'),
                                        ],
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Aturan Denda',
                                        style: textApp.bodySmall2,
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                          'Denda diberlakukan jika penyewa membayar tagihan gudang melewati 14 hari dari tanggal tagihan, nominal denda adalah Rp.40.000.000')
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text('Selengkapnya',
                        style: TextStyle(color: colorApp.stateInfo)),
                  )
                ]),
                SizedBox(height: 16),
                // AKAN DATANG
                Text(
                  'Akan Datang',
                  style: textApp.bodySmall,
                ),
                SizedBox(
                  height: 16,
                ),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: colorApp.mainColor,
                      ),
                      width: double.infinity,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tahun Ke-3',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('Belum Dibayar',
                                style: TextStyle(color: colorApp.stateError))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jumlah Tagihan'),
                          Text('Rp 50.000.000')
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1 Agustus 2023'),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Bayar',
                              style: textApp.bodySmall,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: colorApp.secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 16),

                // LUNAS
                Text(
                  'Lunas',
                  style: textApp.bodySmall,
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: colorApp.mainColor,
                      ),
                      width: double.infinity,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tahun Ke-3',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('Lunas',
                                style: TextStyle(color: colorApp.stateSuccess))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jumlah Tagihan'),
                          Text('Rp 50.000.000')
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1 Agustus 2023'),
                          ElevatedButton(
                            onPressed: null,
                            child: Text(
                              'Bayar',
                              style: textApp.bodySmall,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: colorApp.secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 32),
                OutlinedButton(
                  onPressed: () {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Berhenti Sewa',
                        style: textApp.heading10,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: colorApp.secondaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Lanjut Sewa', style: textApp.heading9),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: colorApp.secondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                )
              ],
            ),
          ),
        ));
  }
}
