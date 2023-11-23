import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';

class KonfirmasiSewa extends StatelessWidget {
  const KonfirmasiSewa({super.key});

  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = ColorApp();
    PaddingCollection paddingApp = PaddingCollection();
    TextCollection textApp = TextCollection();
    DecorationCollection fieldStyle = DecorationCollection();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengajuan Sewa',
          style: textApp.heading6,
        ),
        leading: Icon(
          Icons.arrow_back,
          color: colorApp.secondaryColor,
        ),
      ),
      body: Stack(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Gudang Kita Bersama',
                                    style: textApp.heading6),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Jakarta Selatan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Rp.20.000.000/bulan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
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
                                style: textApp.bodySmall
                                    .copyWith(fontWeight: FontWeight.w600),
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
                            '11-09-2001',
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
                            'Tahunan',
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
                          Text(
                            '3 Minggu',
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
                            '23-09-2001',
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
                            'Osama Bin Laden',
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
                            'ladeenloveboom@gmail.com',
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
                            'No. Telp',
                            style: textApp.bodySmall
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '0276432564',
                            style: textApp.bodySmall
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ]),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: textApp.heading6
                                  .copyWith(color: colorApp.light1),
                            ),
                            Text(
                              'Rp.20.000.000,00',
                              style: textApp.heading6
                                  .copyWith(color: colorApp.light1),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Durasi Sewa',
                              style: textApp.bodySmall.copyWith(
                                  color: colorApp.light1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'xx Minggu',
                              style: textApp.bodySmall.copyWith(
                                  color: colorApp.light1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorApp.secondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
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
