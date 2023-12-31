import 'dart:convert';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/favorite_controller.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:capstone_wms/services/favorite_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // FavoriteController favoriteController = Get.find<FavoriteController>();
  FavoriteController favoriteController = Get.put(FavoriteController());
  FavoriteService favoriteService = FavoriteService();
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();
  // late Future<List<dynamic>>? warehouseData;
  // bool isLoading = false;
  final formatter = NumberFormat("#,###");

  @override
  void initState() {
    super.initState();
    favoriteController.favoriteList;
    favoriteController.getWarehouseData();
  }

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
        title: Text('Favorite', style: textCollection.heading6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => FutureBuilder<List<dynamic>>(
            future: favoriteController.favoriteList.isNotEmpty
                ? Future.value(favoriteController.favoriteList)
                : null,
            builder: (context, snapshot) {
              if (favoriteController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colorApp.mainColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null ||
                  favoriteController.favoriteList.isEmpty) {
                return const Center(
                  child: Text('No data found'),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: favoriteController.favoriteList.length,
                  itemBuilder: (context, int index) {
                    var item = favoriteController.favoriteList[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => Get.to(
                              DetailGudangScreen(warehouseId: item['id'])),
                          child: Card(
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
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: item['image'] != null &&
                                            Uri.parse(item['image']).isAbsolute
                                        ? Image.network(
                                            item['image'],
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
                                                'Gudang ${capitalizeFirstLetter(item['warehouseTypeName'])}',
                                                // '${item['warehouseTypeName']}'
                                                textAlign: TextAlign.center,
                                                style: textCollection.bodySmall
                                                    .copyWith(
                                                        color:
                                                            colorApp.mainColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          item['name'],
                                          style: textCollection.bodyNormal
                                              .copyWith(
                                                  color: colorApp.mainColor),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        // const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined,
                                                color: colorApp.mainColor),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                item['regencyName'],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: colorApp.mainColor),
                                                overflow: TextOverflow.ellipsis,
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
                                              "${formatter.format(item['surfaceArea'])} m²",
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
                                                "${formatter.format(item['buildingArea'])} m²",
                                                style: TextStyle(
                                                  color: colorApp.mainColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Rp. ${formatter.format(item['annualPrice'])}/Tahun",
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
                                          await favoriteController
                                              .deleteFavorite(
                                                  item['id'].toString());
                                          favoriteController.getWarehouseData();
                                        },
                                        icon: const Icon(
                                          Icons.star,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
