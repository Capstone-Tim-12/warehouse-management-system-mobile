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
          'https://smartlegal.id/wp-content/uploads/2023/09/Tanda-Daftar-Gudang-jpg.webp',
      'title': 'Gudang',
      'price': 'Rp. 2 Miliar',
      'location': 'Grendeng, Purwokerto',
      'landArea': 'Luas Tanah',
      'buildingArea': 'Luas Bangunan',
    },
    {
      'imageURL':
          'https://smartlegal.id/wp-content/uploads/2023/09/Tanda-Daftar-Gudang-jpg.webp',
      'title': 'Gudang',
      'price': 'Rp. 4 Miliar',
      'location': 'Sudirman, Bandung',
      'landArea': 'Luas Tanah',
      'buildingArea': 'Luas Bangunan',
    },
    {
      'imageURL':
          'https://smartlegal.id/wp-content/uploads/2023/09/Tanda-Daftar-Gudang-jpg.webp',
      'title': 'Gudang',
      'price': 'Rp. 3 Miliar',
      'location': 'Sumampir, Purwokerto',
      'landArea': 'Luas Tanah',
      'buildingArea': 'Luas Bangunan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, int index) {
                    final item = items[index];
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item['imageURL'],
                                  width: 380,
                                  height: 175,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.star,
                                  color: colorApp.secondaryColor,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorApp.secondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: Text(item['title'],
                                style: TextStyle(color: colorApp.dark1)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['price'],
                                    style: textCollection.normalLabel),
                                const SizedBox(height: 8),
                                Text(item['location'],
                                    style: textCollection.bodySmall),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.warehouse),
                            const SizedBox(width: 8),
                            Text(item['landArea'],
                                style: TextStyle(
                                    color: colorApp.dark1,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 8),
                            const Icon(Icons.apartment),
                            const SizedBox(width: 8),
                            Text(item['buildingArea'],
                                style: TextStyle(
                                    color: colorApp.dark1,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 21),
                        Divider(color: colorApp.dark1),
                        const SizedBox(height: 21),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
