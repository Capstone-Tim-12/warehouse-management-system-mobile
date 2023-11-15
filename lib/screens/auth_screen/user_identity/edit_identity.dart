import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class EditIdentity extends StatefulWidget {
  const EditIdentity({super.key});

  @override
  State<EditIdentity> createState() => _EditIdentityState();
}

class _EditIdentityState extends State<EditIdentity> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  //controller
  TextEditingController nikCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.bgAuthScaffold,
      appBar: AppBar(
        backgroundColor: colorApp.bgAuthScaffold,
        title: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: ShapeDecoration(
                color: colorApp.stateSuccess,
                shape: const OvalBorder(),
              ),
              child: Icon(
                Icons.check,
                color: colorApp.light1,
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              width: 12,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: const ShapeDecoration(
                color: Color(0xFF0063F7),
                shape: OvalBorder(),
              ),
              child: const Center(
                  child: Text(
                '2',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              'Cek Data',
              style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              // width: double.infinity,
              width: 125,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: ShapeDecoration(
                color: colorApp.light1,
                shape: const OvalBorder(),
              ),
              child: const Center(
                  child: Text(
                '3',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: paddingApp.scaffoldPadding,
            child: ListView(
              children: [
                Text(
                  'Ubah Data Diri',
                  style: textApp.heading3.copyWith(fontSize: 27),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Data Diri',
                      style: textApp.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'NIK',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: TextField(
                    controller: nikCont,
                    decoration: fieldStyle.nikField,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                Text(
                  'Nama Lengkap',
                  style: textApp.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 44,
                  child: TextField(
                    controller: nikCont,
                    decoration: fieldStyle.nikField,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
