import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();

  final List<Map<String, dynamic>> items = [
    {
      'imageURL':
          'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Gudang',
      'name': 'Warehouse Abadi',
      'location': 'Jakarta Barat',
      'landArea': '1.396 m²',
      'buildingArea': '1.348 m²',
      'price': 'Rp. 107.840.000/bln',
    },
    {
      'imageURL':
          'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Gudang',
      'name': 'Adhi Jaya Gudang',
      'location': 'Purwokerto',
      'landArea': '440 m²',
      'buildingArea': '300 m²',
      'price': 'Rp. 24.000.000/bln',
    },
    {
      'imageURL':
          'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Gudang',
      'name': 'Adhimetal group',
      'location': 'Jakarta Selatan',
      'landArea': '550 m²',
      'buildingArea': '350 m²',
      'price': 'Rp. 28.000.000/bln',
    },
    {
      'imageURL':
          'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Gudang',
      'name': 'Marga Jaya',
      'location': 'Purwokerto Barat',
      'landArea': '660 m²',
      'buildingArea': '500 m²',
      'price': 'Rp. 40.000.000/bln',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite', style: textCollection.heading6),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, int index) {
              final item = items[index];
              return Column(
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: colorApp.dark4,
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item['imageURL'],
                              width: 142,
                              height: 227,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Container(
                                  width: 80,
                                  height: 32,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: colorApp.dark1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item['title'],
                                        textAlign: TextAlign.center,
                                        style: textCollection.bodySmall
                                            .copyWith(
                                                color: colorApp.mainColor),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  item['name'],
                                  style: textCollection.bodyNormal
                                      .copyWith(color: colorApp.mainColor),
                                ),
                                // const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: colorApp.mainColor),
                                    const SizedBox(width: 8),
                                    Text(
                                      item['location'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: colorApp.mainColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Icon(Icons.crop_square,
                                        color: colorApp.mainColor),
                                    const SizedBox(width: 8),
                                    Text(
                                      item['landArea'],
                                      style: TextStyle(
                                        color: colorApp.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(Icons.apartment,
                                        color: colorApp.mainColor),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        item['buildingArea'],
                                        style: TextStyle(
                                          color: colorApp.mainColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item['price'],
                                  style: textCollection.bodySmall
                                      .copyWith(color: colorApp.mainColor),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.star,
                              color: colorApp.mainColor,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
