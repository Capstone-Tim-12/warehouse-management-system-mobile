import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: TextCollection.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: TextCollection.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: TextCollection.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: TextCollection.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: TextCollection.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1589792923962-537704632910?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: TextCollection.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: TextCollection.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: TextCollection.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: TextCollection.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: TextCollection.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1586528116493-a029325540fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: TextCollection.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: TextCollection.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: TextCollection.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: TextCollection.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: TextCollection.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
