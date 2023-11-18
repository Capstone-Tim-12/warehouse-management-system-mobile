import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ],
        ),
      ),
    );
  }
}
