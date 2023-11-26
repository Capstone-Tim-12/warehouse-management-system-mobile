import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();

  bool switchValue1 = true;
  bool switchValue2 = true;
  bool switchValue3 = true;
  bool switchValue4 = true;
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: textCollection.heading6,
        ),
        backgroundColor: colorApp.light3,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(
            left: 24, right: 24, top: 8, bottom: 24),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              activeColor: colorApp.secondaryColor,
              inactiveThumbColor: colorApp.light4,
              thumbColor:
                  MaterialStateProperty.all(colorApp.light4),
              trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
              inactiveTrackColor: colorApp.dark4,
              value: switchValue1,
              onChanged: (bool? value) {
                setState(() {
                  switchValue1 = value!;
                });
              },
              title: Text('Pesan', style: textCollection.bodyNormal.copyWith(color: colorApp.mainColor)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Tampilkan pesan baru pada pop up', 
                style: textCollection.bodyNormalLight.copyWith(fontSize: 12, color: colorApp.mainColor),),
              ),
            ),
            const Divider(indent: 20, endIndent: 20, height: 16),
              SwitchListTile(
                activeColor: colorApp.secondaryColor,
                inactiveThumbColor: colorApp.light4,
                thumbColor:
                    MaterialStateProperty.all(colorApp.light4),
                trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
                inactiveTrackColor: colorApp.dark4,
                value: switchValue2,
                onChanged: (bool? value) {
                  setState(() {
                    switchValue2 = value!;
                  });
                },
                title: Text('Rekomendasi', style: textCollection.bodyNormal.copyWith(color: colorApp.mainColor)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Tingkatkan pengalaman dengan rekomendasi terbaik', 
                  style: textCollection.bodyNormalLight.copyWith(fontSize: 12, color: colorApp.mainColor)),
                ),
              ),
              const Divider(indent: 20, endIndent: 20, height: 16),
              SwitchListTile(
                activeColor: colorApp.secondaryColor,
                inactiveThumbColor: colorApp.light4,
                thumbColor:
                    MaterialStateProperty.all(colorApp.light4),
                trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
                inactiveTrackColor: colorApp.dark4,
                value: switchValue3,
                onChanged: (bool? value) {
                  setState(() {
                    switchValue3 = value!;
                  });
                },
                title: Text('Lokasi', style: textCollection.bodyNormal.copyWith(color: colorApp.mainColor)),
                subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Tampilkan gudang sesuai lokasi anda', 
                style: textCollection.bodyNormalLight.copyWith(fontSize: 12, color: colorApp.mainColor)),
              ),
            ),
            const Divider(indent: 20, endIndent: 20, height: 16),
              SwitchListTile(
                activeColor: colorApp.secondaryColor,
                inactiveThumbColor: colorApp.light4,
                thumbColor:
                    MaterialStateProperty.all(colorApp.light4),
                trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
                inactiveTrackColor: colorApp.dark4,
                value: switchValue4,
                onChanged: (bool? value) {
                  setState(() {
                    switchValue4 = value!;
                  });
                },
                title: Text('Pembaruan Aplikasi', style: textCollection.bodyNormal.copyWith(color: colorApp.mainColor)),
                subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Tingkatkan pengalaman dengan pembaruan aplikasi yang tersedia', 
                style: textCollection.bodyNormalLight.copyWith(fontSize: 12, color: colorApp.mainColor)),
                ),
              ),
              const Divider(indent: 20, endIndent: 20, height: 16),
          ]
        )
      ),
    );
  }
}