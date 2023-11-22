import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
// import 'package:capstone_wms/components/dropdown_sewa.dart';
import 'package:capstone_wms/components/dropdownsewa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PengajuanSewa extends StatefulWidget {
  const PengajuanSewa({Key? key}) : super(key: key);

  @override
  State<PengajuanSewa> createState() => _PengajuanSewaState();
}

class _PengajuanSewaState extends State<PengajuanSewa> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  String? selectedSewa;

  //variable date buat masuk
  DateTime selectedDateMasuk = DateTime.now();
  DateTime selectedDateKeluar = DateTime.now();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // String date = selectedDate.day.toString();
    // String month = selectedDate.month.toString();
    // String year = selectedDate.year.toString();
    //variable date buat masuk
    String dateMasuk = selectedDateMasuk.day.toString();
    String monthMasuk = selectedDateMasuk.day.toString();
    String yearMasuk = selectedDateMasuk.day.toString();

//variable date buat keluar
    String dateKeluar = selectedDateKeluar.day.toString();
    String monthKeluar = selectedDateKeluar.day.toString();
    String yearKeluar = selectedDateKeluar.day.toString();

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
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,

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
              Text('Tanggal Penyewaan', style: textApp.bodySmall),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Hitungan Sewa',
                style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 12,
              ),
              Dropdownsss(
                hitunganSwea: (p0) {
                  selectedSewa = p0;
                  print(selectedSewa);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Tanggal Masuk',
                style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: DateTime(1890),
                      lastDate: DateTime(now.year + 100));

                  setState(() {
                    if (selectDate != null) {
                      selectedDateMasuk = selectDate;
                      setState(() {
                        dateMasuk = selectedDateMasuk.day.toString();
                        monthMasuk = selectedDateMasuk.month.toString();
                        yearMasuk = selectedDateMasuk.year.toString();
                      });
                      print(dateMasuk);
                      // print(selectedDateMasuk.day);
                      // print(selectedDateMasuk.month);
                      // print(selectedDateMasuk.year);
                    }
                  });
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: colorApp.dark4),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: colorApp.secondaryColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal Masuk',
                                style: textApp.bodySmall.copyWith(
                                    fontSize: 8, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy')
                                    .format(selectedDateMasuk),
                                style: textApp.bodySmall
                                    .copyWith(fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Tanggal Keluar',
                style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: DateTime(1890),
                      lastDate: DateTime(now.year + 100));

                  setState(() {
                    if (selectDate != null) {
                      selectedDateKeluar = selectDate;
                      dateKeluar = selectedDateKeluar.day.toString();
                      monthKeluar = selectedDateKeluar.month.toString();
                      yearKeluar = selectedDateKeluar.year.toString();
                      // print(selectedDateKeluar.day);
                      // print(selectedDateKeluar.month);
                      // print(selectedDateKeluar.year);
                    }
                  });
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: colorApp.dark4),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: colorApp.secondaryColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal Masuk',
                                style: textApp.bodySmall.copyWith(
                                    fontSize: 8, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy')
                                    .format(selectedDateKeluar),
                                style: textApp.bodySmall
                                    .copyWith(fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),

        //positioned disini
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
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
                            child: Text('Lanjutkan',
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
      ]),
    );
  }
}
