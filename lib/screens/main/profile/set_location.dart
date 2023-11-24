import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/constants/city_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class SetLocation extends StatelessWidget {
  SetLocation({super.key});

  List<String> allCities = Cities.kotaList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp.mainColor,
        iconTheme: IconThemeData(
          color: colorApp.mainColor,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Lokasi",
          style: TextCollection().heading5white,
        ),
      ),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: colorApp.mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          style: TextStyle(color: ColorApp().dark1),
                          decoration: InputDecoration(
                            hintText: "Cari lokasi anda",
                            hintStyle: TextCollection().SmallInvLabel,
                            fillColor: ColorApp().light4,
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: ColorApp().secondaryColor,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "Depok, Jawa Barat, Indonesia",
                              style: TextCollection().bodyNormalwhite,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: allCities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(allCities[index], style: TextCollection().bodySmall),
                  onTap: () {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
