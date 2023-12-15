import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/recommendation_cont.dart';
import 'package:capstone_wms/controllers/search_controller.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:capstone_wms/services/favorite_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecommendList extends StatefulWidget {
  const RecommendList({super.key});

  @override
  State<RecommendList> createState() => _RecommendListState();
}

class _RecommendListState extends State<RecommendList> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();

  FindController searchController = Get.put(FindController());
  FavoriteService favoriteService = FavoriteService();
  RecommendationController recController = Get.put(RecommendationController());

  // final List<Map<String, dynamic>> items = [
  //   {
  //     'imageURL':
  //         'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //     'title': 'Gudang',
  //     'name': 'Warehouse Abadi',
  //     'location': 'Jakarta Barat',
  //     'landArea': '1.396 m²',
  //     'buildingArea': '1.348 m²',
  //     'price': 'Rp. 107.840.000/Tahun',
  //   },
  //   {
  //     'imageURL':
  //         'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //     'title': 'Gudang',
  //     'name': 'Adhi Jaya Gudang',
  //     'location': 'Purwokerto',
  //     'landArea': '440 m²',
  //     'buildingArea': '300 m²',
  //     'price': 'Rp. 24.000.000/Tahun',
  //   },
  //   {
  //     'imageURL':
  //         'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //     'title': 'Gudang',
  //     'name': 'Adhimetal group',
  //     'location': 'Jakarta Selatan',
  //     'landArea': '550 m²',
  //     'buildingArea': '350 m²',
  //     'price': 'Rp. 28.000.000/Tahun',
  //   },
  //   {
  //     'imageURL':
  //         'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //     'title': 'Gudang',
  //     'name': 'Marga Jaya',
  //     'location': 'Purwokerto Barat',
  //     'landArea': '660 m²',
  //     'buildingArea': '500 m²',
  //     'price': 'Rp. 40.000.000/Tahun',
  //   },
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recController.getRecommendation();
  }

  final formatter = NumberFormat("#,###");

  String capitalizeFirstLetter(String text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Lokasi', style: textCollection.heading6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(() => FutureBuilder<List<dynamic>>(
            future: recController.recommededData.isNotEmpty
                ? Future.value(recController.recommededData)
                : null,
            builder: (context, snapshot) {
              if (recController.isRecommendationLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorApp().mainColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null ||
                  recController.recommededData.isEmpty) {
                return Center(
                  child: Text(
                    'Gudang Tidak Ditemukan',
                    style: TextCollection()
                        .bodySmall
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                );
              } else {
                return ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    itemCount: recController.recommededData.length,
                    itemBuilder: (context, index) {
                      var warehouse = recController.recommededData[index];
                      return InkWell(
                        onTap: () => Get.to(() =>
                            DetailGudangScreen(warehouseId: warehouse['id'])),
                        child: Column(
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
                                      // child: Image.network(
                                      //   // "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      //   warehouse['image'],
                                      //   width: 142,
                                      //   height: 227,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      child: warehouse['image'] != null &&
                                              Uri.parse(warehouse['image'])
                                                  .isAbsolute
                                          ? Image.network(
                                              warehouse['image'],
                                              width: 142,
                                              height: 227,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.network(
                                                  "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                                  width: 142,
                                                  height: 227,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : Image.network(
                                              "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                              width: 142,
                                              height: 227,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    const SizedBox(width: 9),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 8),
                                          Container(
                                            // width: 80,
                                            height: 32,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: colorApp.dark1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Gudang ${capitalizeFirstLetter(warehouse['warehouseTypeName'])}'
                                                      // '${warehouse['warehouseTypeName']}'

                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: textCollection
                                                      .bodySmall
                                                      .copyWith(
                                                          color: colorApp
                                                              .mainColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            warehouse['name'].toString(),
                                            style: textCollection.bodyNormal
                                                .copyWith(
                                                    color: colorApp.mainColor),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,
                                                  color: colorApp.mainColor),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  warehouse['regencyName']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          colorApp.mainColor),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
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
                                                " ${formatter.format(warehouse['surfaceArea'])} m²"
                                                    .toString(),
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
                                                  "${formatter.format(warehouse['buildingArea'])} m²"
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: colorApp.mainColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Rp. ${formatter.format(warehouse['annualPrice'])}/Tahun"
                                                .toString(),
                                            style: textCollection.bodySmall
                                                .copyWith(
                                                    color: colorApp.mainColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: IconButton(
                                          onPressed: () async {
                                            final response =
                                                await favoriteService
                                                    .addToFavorites(
                                                        warehouse['id']);
                                            print(response.statusCode);
                                            print(warehouse['id']);
                                            if (response.statusCode == 201) {
                                              Get.snackbar(
                                                "Berhasil",
                                                "Berhasil ditambahkan ke favorit",
                                                backgroundColor:
                                                    colorApp.light1,
                                              );
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.star_border_outlined,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    });
              }
            })),
      ),
    );
  }
}
