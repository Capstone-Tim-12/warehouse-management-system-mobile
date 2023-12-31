import 'dart:convert';

import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/bottomsheetFilter.dart';
import 'package:capstone_wms/components/bs_filter.dart';
import 'package:capstone_wms/controllers/favorite_controller.dart';
import 'package:capstone_wms/controllers/search_controller.dart';
import 'package:capstone_wms/controllers/warehouse_controller.dart';
import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:capstone_wms/screens/main/favorites/favorite_screen.dart';
import 'package:capstone_wms/services/favorite_services.dart';
import 'package:capstone_wms/services/warehouse_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textCollection = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  final ScrollController scrollController = ScrollController();

  TextEditingController searchCont = TextEditingController();
  // late TextEditingController searchCont;
  FindController searchController = Get.put(FindController());
  FavoriteController favoriteController = Get.put(FavoriteController());
  WarehouseServidces warehoouseServices = WarehouseServidces();
  FavoriteService favoriteService = FavoriteService();
  bool isLoading = false;
  bool isFavorite = false;
  // late Future<List<dynamic>> warehouseData;
  // List<dynamic>? warehouseData;
  final formatter = NumberFormat("#,###");

  void showFilter(BuildContext param) {
    showModalBottomSheet(
        context: param,
        isScrollControlled: true,
        builder: (context) => BottomSheetFilter(
              onFilterPressed: () {
                // Get.back();
                searchController.getWarehouseData();
              },
            ));
  }

  String capitalizeFirstLetter(String text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // print('call');
      searchController.loadMoreData();
    } else {
      // print('don\'t call');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchCont.text = searchController.searchString.value;
    // warehouseData = null;
    // getWarehouseData();
    searchController.getWarehouseData();
    scrollController.addListener(() => _scrollListener());
  }

  @override
  Widget build(BuildContext context) {
    // BuildContext kontext = context;
    // final searchQuery = Get.arguments as String;
    // searchCont.text = searchQuery;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                          searchController.clearWarehouseData();
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: colorApp.secondaryColor,
                        )),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: MediaQuery.of(context).size.height * 0.0431,
                      // color: colorApp.light1,
                      child: TextField(
                        onSubmitted: (value) {
                          searchController.onSearchChanged(value);
                          searchController.clearWarehouseData();
                          searchController.getWarehouseData();
                          print(searchCont.text);
                        },
                        controller: searchCont,
                        style: textCollection.bodySmall
                            .copyWith(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          // labelText: 'Search',
                          hintText: 'Search',
                          hintStyle: textCollection.bodySmall,
                          contentPadding: const EdgeInsets.only(bottom: 1),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showFilter(context);
                        // filterBottomSheet(context);
                      },
                      icon: const Icon(Icons.filter_list_rounded),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Obx(
              () => FutureBuilder<List<dynamic>?>(
                future: searchController.warehouseData.isNotEmpty
                    ? Future.value(searchController.warehouseData)
                    : null,
                builder: (context, snapshot) {
                  if (searchController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colorApp.mainColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  // else if (snapshot.connectionState ==
                  //     ConnectionState.waiting) {
                  //   return Center(
                  //     child: CircularProgressIndicator(
                  //       color: colorApp.secondaryColor,
                  //     ),
                  //   );
                  // }
                  else if (snapshot.data == null ||
                      searchController.warehouseData.isEmpty) {
                    return Center(
                      child: Text(
                        "Gudang Tidak Ditemukan",
                        style: textCollection.bodySmall
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      controller: scrollController,
                      itemCount: searchController.isMoreLoading.value
                          ? searchController.warehouseData.length + 1
                          : searchController.warehouseData.length,
                      itemBuilder: (context, index) {
                        if (index < searchController.warehouseData.length) {
                          var warehouse = searchController.warehouseData[index];
                          return GestureDetector(
                            onTap: () {
                              // disini buat ke detail screen nanti
                              // Get.to(()=> DetailGudang())
                              Get.to(() => DetailGudangScreen(
                                  warehouseId: warehouse['id']));
                            },
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: warehouse['image'] != null &&
                                                  Uri.parse(warehouse['image'])
                                                      .isAbsolute
                                              ? Image.network(
                                                  warehouse['image'],
                                                  width: 142,
                                                  height: 227,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
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
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Gudang ${capitalizeFirstLetter(warehouse['warehouseTypeName'])}'
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
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
                                                        color:
                                                            colorApp.mainColor),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 16),
                                              Row(
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color:
                                                          colorApp.mainColor),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      warehouse['regencyName']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: colorApp
                                                              .mainColor),
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
                                                      color:
                                                          colorApp.mainColor),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    " ${formatter.format(warehouse['surfaceArea'])} m²"
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: colorApp.mainColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Icon(Icons.apartment,
                                                      color:
                                                          colorApp.mainColor),
                                                  const SizedBox(width: 8),
                                                  Flexible(
                                                    child: Text(
                                                      "${formatter.format(warehouse['buildingArea'])} m²"
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            colorApp.mainColor,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        color:
                                                            colorApp.mainColor),
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
                                                    .addToFavorites(
                                                        warehouse['id']);
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
                        } else {
                          return Center(
                            child: LinearProgressIndicator(
                              color: colorApp.mainColor,
                            ),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            )));
  }
}
