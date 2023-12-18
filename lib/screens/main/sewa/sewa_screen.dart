import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
// import 'package:capstone_wms/components/dropdown_sewa.dart';
import 'package:capstone_wms/components/dropdownsewa.dart';
import 'package:capstone_wms/controllers/warehouse_controller.dart';
import 'package:capstone_wms/models/rentinfo_model.dart';
import 'package:capstone_wms/models/warehouse_model.dart';
import 'package:capstone_wms/screens/main/sewa/konfirmasi_sewa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PengajuanSewa extends StatefulWidget {
  PengajuanSewa({Key? key, required this.selectedWarehouse}) : super(key: key);

  WarehouseModel selectedWarehouse;

  @override
  State<PengajuanSewa> createState() => _PengajuanSewaState();
}

class _PengajuanSewaState extends State<PengajuanSewa> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  int durasi = 0;

  TextEditingController durasiCont = TextEditingController();

  WarehouseController warehouseCont = Get.put(WarehouseController());
  // WarehouseController warehouseCont =
  //     Get.find<WarehouseController>() ?? WarehouseController();

  String? selectedSewa;
  int? selectedSewaValue;

  //variable date buat masuk
  DateTime selectedDateMasuk = DateTime.now();
  DateTime selectedDateKeluar = DateTime.now();
  DateTime now = DateTime.now();
  int total = 0;

  void _updateTanggalKeluar() {
    if (selectedSewa != null && durasi > 0) {
      DateTime newDateKeluar = selectedDateMasuk;

      if (selectedSewaValue == 1) {
        setState(() {
          newDateKeluar = newDateKeluar.add(Duration(days: durasi * 7));
        });
      }

      if (selectedSewaValue == 2) {
        setState(() {
          newDateKeluar = newDateKeluar.add(Duration(days: durasi * 30));
        });
      }

      if (selectedSewaValue == 3) {
        setState(() {
          newDateKeluar = newDateKeluar.add(Duration(days: durasi * 365));
        });
      }

      setState(() {
        selectedDateKeluar = newDateKeluar;
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    durasiCont.text = '$durasi';
    print(warehouseCont.selectedWarehouse.value.name);
    print(warehouseCont.selectedWarehouse.value.warehouseId);
    print(warehouseCont.selectedWarehouse.value.monthlyPrice);
    print(warehouseCont.selectedWarehouse.value.annuallyPrice);
    print(warehouseCont.selectedWarehouse.value.weeklyPrice);
    setState(() {});
  }

  void _updateNumber() {
    setState(() {
      durasi = int.parse(durasiCont.text) ?? 0;
      _updateTanggalKeluar();
    });
  }

  void _increaseNumber() {
    setState(() {
      durasi++;
      durasiCont.text = '$durasi';
      _updateTanggalKeluar();
    });
  }

  void _decreaseNumber() {
    setState(() {
      durasi--;
      durasiCont.text = '$durasi';
      _updateTanggalKeluar();
    });
  }

  final formatter = NumberFormat("#,###");

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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: colorApp.secondaryColor,
            )),
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
                      widget.selectedWarehouse.image != null &&
                              Uri.parse(widget.selectedWarehouse.image?[0])
                                  .isAbsolute
                          ? Image.network(
                              // 'https://media.istockphoto.com/id/1227641291/id/foto/tampilan-sudut-tinggi-gudang-yang-ditumpuk-dengan-kotak-dalam-ukuran-berbeda.jpg?s=1024x1024&w=is&k=20&c=e4JHyQcfhRt0sR-AH1CslMYFBLtkfmyvgmShLDIDqQ4=',
                              widget.selectedWarehouse.image?[0],
                              // Image.network(
                              //   'https://via.placeholder.com/142x160',
                              fit: BoxFit.fitHeight,
                              width: 142,
                              height: 160,
                              errorBuilder: (context, error, stackTrace) {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: textApp.bodySmall
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              if (selectedSewaValue == null)
                                Text(
                                  "Rp.${formatter.format(widget.selectedWarehouse.monthlyPrice)}/Bulan",
                                  // 'Rp.20.000.000/bulan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              if (selectedSewaValue == 1)
                                Text(
                                  "Rp.${formatter.format(widget.selectedWarehouse.weeklyPrice)}/Minggu",
                                  // 'Rp.20.000.000/bulan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              if (selectedSewaValue == 2)
                                Text(
                                  "Rp.${formatter.format(widget.selectedWarehouse.monthlyPrice)}/Bulan",
                                  // 'Rp.20.000.000/bulan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              if (selectedSewaValue == 3)
                                Text(
                                  "Rp.${formatter.format(widget.selectedWarehouse.annuallyPrice)}/Tahun",
                                  // 'Rp.20.000.000/bulan',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.56,
                    child: Dropdownsss(
                      hitunganSwea: (p0) {
                        // selectedSewa = p0.toString();
                        selectedSewaValue = p0;
                        // print(selectedSewa);
                        print(selectedSewaValue);
                        _updateTanggalKeluar();
                      },
                      keteranganSwea: (p0) {
                        selectedSewa = p0;
                      },
                    ),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // )
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.271,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: colorApp.dark4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: durasiCont.text == '0'
                                ? null
                                : () => _decreaseNumber(),
                            child: SvgPicture.asset('assets/svg/minus.svg')),
                        SizedBox(
                          width: 36,
                          height: 18,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                            ],
                            onChanged: (value) => _updateNumber(),
                            style: textApp.bodySmall
                                .copyWith(fontWeight: FontWeight.w400),
                            controller: durasiCont,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: "",
                              contentPadding:
                                  EdgeInsets.only(top: 10, bottom: 10),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: selectedSewaValue == 0
                                ? null
                                : () => _increaseNumber(),
                            child: SvgPicture.asset('assets/svg/plus.svg')),
                      ],
                    ),
                  )
                ],
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
                onTap: selectedSewaValue == null && durasiCont.text == '0'
                    ? null
                    : () async {
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
              Container(
                height: 56,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colorApp.dark4),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                              'Tanggal Keluar',
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
                      if (selectedSewaValue == 0) const SizedBox(),
                      if (selectedSewaValue == 1 ||
                          selectedSewaValue == 2 ||
                          selectedSewaValue == 3)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: textApp.heading6
                                  .copyWith(color: colorApp.light1),
                            ),
                            if (selectedSewaValue == 0) const SizedBox(),
                            if (selectedSewaValue == 1)
                              Text(
                                'Rp. ${formatter.format(widget.selectedWarehouse.weeklyPrice * durasi)}',
                                style: textApp.heading6
                                    .copyWith(color: colorApp.light1),
                              ),
                            if (selectedSewaValue == 2)
                              Text(
                                'Rp. ${formatter.format(widget.selectedWarehouse.monthlyPrice * durasi)}',
                                style: textApp.heading6
                                    .copyWith(color: colorApp.light1),
                              ),
                            if (selectedSewaValue == 3)
                              Text(
                                'Rp. ${formatter.format(widget.selectedWarehouse.annuallyPrice * durasi)}',
                                style: textApp.heading6
                                    .copyWith(color: colorApp.light1),
                              ),
                          ],
                        ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorApp.secondaryColor,
                                disabledBackgroundColor:
                                    colorApp.secondaryColorLighter,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: durasiCont.text == '0'
                                ? null
                                : () {
                                    if (selectedSewaValue == 1) {
                                      total =
                                          widget.selectedWarehouse.weeklyPrice *
                                              durasi;
                                    } else if (selectedSewaValue == 2) {
                                      total = widget
                                              .selectedWarehouse.monthlyPrice *
                                          durasi;
                                    } else if (selectedSewaValue == 3) {
                                      total = widget
                                              .selectedWarehouse.annuallyPrice *
                                          durasi;
                                    }
                                    RentInfo rentWarehouse = RentInfo(
                                        durasiSewa: durasiCont.text,
                                        entryDate: DateFormat('dd/MM/yyyy')
                                            .format(selectedDateMasuk),
                                        hitunganSewa: selectedSewa!,
                                        hitunganSewaId: selectedSewaValue!,
                                        outDate: DateFormat('dd/MM/yyyy')
                                            .format(selectedDateKeluar),
                                        totalPrice: total);

                                    Get.to(KonfirmasiSewa(
                                      selectedWarehouse:
                                          widget.selectedWarehouse,
                                      rentInformation: rentWarehouse,
                                    ));
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
