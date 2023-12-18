import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/payment_controller.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
// import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:capstone_wms/screens/payment/payment_screen_failed.dart';
import 'package:capstone_wms/screens/payment/payment_screen_success.dart';
import 'package:capstone_wms/screens/payment/payment_virtual_account.dart';
import 'package:capstone_wms/widget/va_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({
    super.key,
    required this.installmentId,
    required this.warehouseId,
    required this.total,
    required this.durasi,
    required this.satuan,
  });
  // int paymentMethodId;
  int installmentId;
  int warehouseId;
  int total;
  int durasi;
  String satuan;
  // String bankCode;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentController paymentCont = Get.put(PaymentController());
  bool showCardTextField = false;
  TextEditingController cardController = TextEditingController();
  String? selectedPaymentMethod;
  final formatter = NumberFormat("#,###");

  String selectedVACode = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentCont.getWarehouseInfo(widget.warehouseId.toString());
    paymentCont.getVAList();
    // print(paymentCont.virtualAccountList);
    print(paymentCont.virtualAccountNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: ColorApp().secondaryColor,
        ),
        title: Text(
          "Pembayaran",
          style: TextCollection().heading6,
        ),
      ),
      body: Obx(
        () => paymentCont.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: colorApp.mainColor,
                  backgroundColor: colorApp.secondaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Detail Pemesanan",
                        style: TextCollection().bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        height: 105,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorApp().dark4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 140,
                              height: 105,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12),
                                ),
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1590247813693-5541d1c609fd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    paymentCont.warehouseInfo['name'],
                                    style: TextCollection().heading6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    paymentCont.warehouseInfo['regencyName'],
                                    // "Jakarta Barat",
                                    style: TextCollection().bodySmall.copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Rp.${formatter.format(paymentCont.warehouseInfo['annualPrice'])}',
                                    // "20.000.000/bulan",
                                    style: TextCollection().bodySmall.copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Metode Pembayaran",
                        style: TextCollection().bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(),
                    ),
                    const SizedBox(height: 10),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Kartu Kredit/Debit",
                          style: TextCollection().heading6,
                        ),
                        subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 120,
                            height: 20,
                            child: SvgPicture.asset(
                              "assets/svg/mastercard.svg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: Icon(Icons.add_rounded),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                          child: Text(
                                        'Tambah Kartu Baru',
                                        style: TextCollection()
                                            .bodySmall
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Text(
                          "Virtual Account",
                          style: TextCollection().heading6,
                        ),
                        subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 190,
                            height: 20,
                            child: SvgPicture.asset(
                              "assets/svg/bank_logo.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Obx(() => FutureBuilder<List<dynamic>>(
                                    future: paymentCont
                                            .virtualAccountList.isNotEmpty
                                        ? Future.value(
                                            paymentCont.virtualAccountList)
                                        : null,
                                    builder: (context, snapshot) {
                                      if (paymentCont.isVALoading.value) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: colorApp.mainColor,
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                            child: Text(
                                                'Error: ${snapshot.error}'));
                                      } else if (snapshot.data == null ||
                                          paymentCont
                                              .virtualAccountList.isEmpty) {
                                        return Center(
                                          child: Text(
                                            "Gudang Tidak Ditemukan",
                                            style: TextCollection()
                                                .bodySmall
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFF2F2F5),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: ListView.builder(
                                            itemCount: paymentCont
                                                .virtualAccountList.length,
                                            itemBuilder: (context, index) {
                                              var vaList = paymentCont
                                                  .virtualAccountList[index];
                                              return VirtualAccountSelectionWidget(
                                                bankName: vaList['name'],
                                                logoAsset: vaList['image'],
                                                isSelected: selectedVACode ==
                                                    vaList['code'],
                                                onSelect: (isSelected) {
                                                  setState(() {
                                                    if (isSelected) {
                                                      selectedVACode =
                                                          vaList['code'];
                                                      print(selectedVACode);
                                                    }
                                                  });
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ))),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorApp().mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextCollection().heading6.copyWith(
                          color: ColorApp().light4,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    "Rp. ${formatter.format(widget.total)}",
                    style: TextCollection().heading6.copyWith(
                          color: ColorApp().light4,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Durasi Sewa",
                    style: TextCollection().smallLabel.copyWith(
                          color: ColorApp().light4,
                        ),
                  ),
                  const Spacer(),
                  if (widget.satuan == 'mingguan')
                    Text(
                      "${widget.durasi} minggu",
                      style: TextCollection().smallLabel.copyWith(
                            color: ColorApp().light4,
                          ),
                    ),
                  if (widget.satuan == 'bulanan')
                    Text(
                      "${widget.durasi} bulan",
                      style: TextCollection().smallLabel.copyWith(
                            color: ColorApp().light4,
                          ),
                    ),
                  if (widget.satuan == 'tahunan')
                    Text(
                      "${widget.durasi} tahun",
                      style: TextCollection().smallLabel.copyWith(
                            color: ColorApp().light4,
                          ),
                    ),
                ],
              ),
              const SizedBox(height: 5),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: paymentCont.isPaymentLoading.value
                      ? Center(
                          child: LinearProgressIndicator(
                            color: colorApp.secondaryColor,
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                colorApp.secondaryColorLighter,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: ColorApp().secondaryColor,
                          ),
                          onPressed: selectedVACode.isEmpty
                              ? null
                              : () {
                                  paymentCont.payVAWarehouse(
                                      widget.installmentId, selectedVACode);
                                },
                          child: Text(
                            "Bayar Tagihan",
                            style: TextCollection()
                                .bodySmall
                                .copyWith(color: ColorApp().light4),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
