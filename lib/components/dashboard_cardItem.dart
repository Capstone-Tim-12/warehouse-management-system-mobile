import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class RecommendedCardWidget extends StatelessWidget {
  const RecommendedCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ganti pakai listview builder nanti
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                ),
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
