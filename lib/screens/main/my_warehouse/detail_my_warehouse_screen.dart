import 'dart:convert';
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
  late List<dynamic> kontrakData;
  late List<dynamic> tagihanData;

  TextCollection textApp = TextCollection();

  @override
  void initState() {
    super.initState();
    fetchKontrakData();
    fetchTagihanData();
  }

  Future<void> fetchKontrakData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.example.com/kontrak'));

      if (response.statusCode == 200) {
        setState(() {
          kontrakData = json.decode(response.body);
        });
      } else {
        print('Gagal mengambil data kontrak: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchTagihanData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.example.com/tagihan'));

      if (response.statusCode == 200) {
        setState(() {
          tagihanData = json.decode(response.body);
        });
      } else {
        print('Gagal mengambil data tagihan: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Warehouse Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 16,
              ),
              WarehouseItem(item: widget.warehouseData),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Flexible(
              //       child: Text('Beri review tentang gudang ini',
              //           style: textApp.heading7.copyWith()),
              //     ),
              //     Text(
              //       'Tulis review',
              //       style: textApp.heading8,
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 24,
              ),
              TabBar(
                tabs: [
                  Tab(
                    child: Text('Kontrak', style: textApp.heading6),
                  ),
                  Tab(
                    child: Text('Tagihan', style: textApp.heading6),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Halaman pertama (Kontrak)
                    KontrakScreen(),
                    // Halaman kedua (Tagihan)
                    TagihanScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KontrakScreen extends StatelessWidget {
  // const KontrakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementasi halaman kontrak
    TextCollection textApp = TextCollection();
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hitung Sewa Bulanan', style: textApp.heading6),
                const SizedBox(height: 16),
                Text('Pembayaran tagihan dilakukan 1 Tahun sekali',
                    style: textApp.bodySmall),
                const SizedBox(
                  height: 34,
                ),
                Text('Tanggal Penagihan', style: textApp.heading6),
                const SizedBox(height: 16),
                Text('Jatuh tempo tagihan sewa setiap tanggal 20',
                    style: textApp.bodySmall),
                const SizedBox(
                  height: 35,
                ),
                const Divider(
                  thickness: 2,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Tanggal Masuk',
                          style: textApp.heading7,
                        ),
                        Text(
                          '1 Des 2019',
                          style: textApp.bodyNormal,
                        ),
                      ],
                    ),
                    SizedBox(width: 6),
                    Column(
                      children: [
                        Text(
                          'Durasi Sewa',
                          style: textApp.heading7,
                        ),
                        Text(
                          '24 Tahun',
                          style: textApp.bodyNormal,
                        ),
                      ],
                    ),
                    SizedBox(width: 6),
                    Column(
                      children: [
                        Text(
                          'Tanggal Keluar',
                          style: textApp.heading7,
                        ),
                        Text(
                          '1 Des 2021',
                          style: textApp.bodyNormal,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                SizedBox(height: 16),
                Text(
                  'Aturan Denda',
                  style: textApp.heading6,
                ),
                const SizedBox(height: 18),
                Text(
                  '''Denda diberlakukan jika penyewa membayar
tagihan gudang melewati 14 hari dari tanggal
tagihan, nominal denda adalah Rp 40.000.000 ''',
                  style: textApp.bodySmall,
                ),
                const Divider(thickness: 2),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorApp.secondaryColor2),
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    'Berhenti Sewa',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorApp.secondaryColor),
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    'Lanjut Sewa',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ])),
    );
  }
}

class TagihanScreen extends StatelessWidget {
  const TagihanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementasi halaman tagihan
    TextCollection textApp = TextCollection();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Akan Datang',
              style: textApp.orangeLabel,
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tahun Kedua',
                            style: textApp.orangeLabel,
                          ),
                          Text(
                            'Belum Dibayar',
                            style: textApp.orangeLabel,
                          ),
                        ]),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah tagihan',
                            style: textApp.bodySmall,
                          ),
                          Text(
                            '3 Maret',
                            style: textApp.bodySmall,
                          ),
                        ]),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp 50.000.000',
                            style: textApp.bodyMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  colorApp.secondaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(40, 25),
                              ),
                            ),
                            child: Text(
                              'Bayar',
                              style: textApp.bodyNormal,
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tahun Ketiga',
                            style: textApp.bodySmall,
                          ),
                          Text(
                            'Belum Dibayar',
                            style: textApp.bodySmall,
                          ),
                        ]),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah tagihan',
                            style: textApp.bodySmall,
                          ),
                          Text(
                            'Jatuh tempo 7 Maret',
                            style: textApp.bodySmall,
                          ),
                        ]),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp 50.000.000',
                            style: textApp.bodyMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  colorApp.secondaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(40, 25),
                              ),
                            ),
                            child: Text(
                              'Bayar',
                              style: textApp.bodyNormal,
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Lunas',
              style: textApp.orangeLabel,
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tahun Kedua',
                            style: textApp.orangeLabel,
                          ),
                          Text(
                            'Belum Dibayar',
                            style: textApp.orangeLabel,
                          ),
                        ]),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah tagihan',
                            style: textApp.bodySmall,
                          ),
                          Text(
                            'Jatuh tempo 7 Maret',
                            style: textApp.bodySmall,
                          ),
                        ]),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp 50.000.000',
                            style: textApp.bodyMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  colorApp.secondaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(40, 25),
                              ),
                            ),
                            child: Text(
                              'Bayar',
                              style: textApp.bodyNormal,
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
