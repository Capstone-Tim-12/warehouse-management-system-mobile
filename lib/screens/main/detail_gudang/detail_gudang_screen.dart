import 'dart:convert';

import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/warehouse_controller.dart';
import 'package:capstone_wms/models/warehouse_model.dart';
import 'package:capstone_wms/screens/main/dashboard/list_picture.dart';
import 'package:capstone_wms/screens/main/dashboard/search_screen.dart';
import 'package:capstone_wms/screens/main/sewa/sewa_screen.dart';
import 'package:capstone_wms/screens/main/detail_gudang/interactive_map_screen.dart';
import 'package:capstone_wms/services/warehouse_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailGudangScreen extends StatefulWidget {
  DetailGudangScreen({super.key, required this.warehouseId});

  int warehouseId;

  @override
  State<DetailGudangScreen> createState() => _DetailGudangScreenState();
}

WarehouseServidces warehoouseServices = WarehouseServidces();
WarehouseController warehouseCont = Get.put(WarehouseController());

bool isLoading = false;
final formatter = NumberFormat("#,###");
late GoogleMapController mapController;
// late LatLng warehouseLatLng;

// late Future<List<dynamic>> warehouseData;
//List<dynamic>? detailWarehouseId;
List<dynamic>? detailWarehouseId;

String capitalizeFirstLetter(String text) {
  if (text == null || text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}

class _DetailGudangScreenState extends State<DetailGudangScreen> {
  // List<dynamic>? detailgudang;
  // Map<String, dynamic> warehouseData = {};
  Map<String, dynamic>? warehouseData;
  List<String>? imageUrls;

  void setSelectedWarehouseState() {
    WarehouseModel selectedWarehouse = WarehouseModel(
        warehouseId: widget.warehouseId,
        name: warehouseData!['name'].toString(),
        regencyName: warehouseData!['regencyName'].toString(),
        weeklyPrice: warehouseData!['weeklyPrice'],
        monthlyPrice: warehouseData!['monthlyPrice'],
        annuallyPrice: warehouseData!['annualPrice'],
        image: warehouseData!['image']);

    setState(() {
      warehouseCont.setSelectedWarehouse(selectedWarehouse);
    });
  }

  Future<void> getDetailWarehouse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      // warehouseData = null;
    });
    try {
      final response = await warehoouseServices.getWarehousebyId(
          widget.warehouseId.toString(), prefs.getString('token')!);
      Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        //List<dynamic>? warehouseList = responseData['data'];
        // imageUrls = List<String>.from(warehouseData!['image']);

        setState(() {
          warehouseData = responseData['data'];
        });

        // setSelectedWarehouseState();

        print(warehouseData);
      } else {
        Get.snackbar(
            response.statusCode.toString(), '${responseData['message']}');
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // searchCont = TextEditingController(text: widget.searchQuery);
    getDetailWarehouse();
    // setSelectedWarehouseState();
    // print(warehouseData!['image']);
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: colorApp.dark4,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorApp.secondaryColor,
          ),
          onPressed: () async {
            // await Get.delete<WarehouseController>(force: true);
            Get.back();
          },
        ),
        title: Text(
          "Detail Gudang",
          style: TextCollection().heading5,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: warehouseData!['image'] != null &&
                            warehouseData!['image'].isNotEmpty
                        // &&
                        // Uri.parse(warehouseData!['image'][0]).isAbsolute
                        ? Image.network(
                            warehouseData!['image'].length > 0
                                ? warehouseData!['image'][0]
                                : "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                // width: 142,
                                // height: 227,
                                fit: BoxFit.fill,
                              );
                            },
                          )
                        : Image.network(
                            "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            // width: 142,
                            // height: 227,
                            fit: BoxFit.fill,
                          ),
                    // child: Image.network(
                    //   'https://picsum.photos/300/200?random=4',
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child: warehouseData!['image'] != null &&
                                  warehouseData!['image'].isNotEmpty
                              // &&
                              // Uri.parse(warehouseData!['image'][1])
                              //     .isAbsolute
                              ? Image.network(
                                  warehouseData!['image'].length > 1
                                      ? warehouseData!['image'][1]
                                      : "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  // width: 142,
                                  // height: 227,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      // width: 142,
                                      // height: 227,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                )
                              : Image.network(
                                  "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  // width: 142,
                                  // height: 227,
                                  fit: BoxFit.fill,
                                ),
                          // child: Image.network(
                          //   'https://picsum.photos/300/200?random=1',
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child: warehouseData!['image'] != null
                              // &&
                              //         warehouseData!['image'].isNotEmpty
                              // &&
                              // Uri.parse(warehouseData!['image'][2])
                              //     .isAbsolute
                              ? Image.network(
                                  warehouseData!['image'].length > 2
                                      ? warehouseData!['image'][2]
                                      : "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  // width: 142,
                                  // height: 227,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      // width: 142,
                                      // height: 227,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                )
                              : Image.network(
                                  "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  // width: 142,
                                  // height: 227,
                                  fit: BoxFit.fill,
                                ),
                          // child: Image.network(
                          //   'https://picsum.photos/300/200?random=3',
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            print('sudah ditekan');
                            Get.to(() => ListPicture(
                                  img: warehouseData!['image'] != null &&
                                          warehouseData!['image'].isNotEmpty
                                      ? warehouseData!['image']
                                      : [],
                                ));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              warehouseData!['image'] != null &&
                                      warehouseData!['image'].isNotEmpty
                                  // &&
                                  // warehouseData!['image'].length >= 3
                                  ? Image.network(
                                      warehouseData!['image'].length > 3
                                          ? warehouseData!['image'][3]
                                          : warehouseData!['image'][0],
                                      // width: 142,
                                      // height: 227,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.network(
                                          "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          // width: 142,
                                          // height: 227,
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    )
                                  : Image.network(
                                      // "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      warehouseData!['image'][0],
                                      // width: 142,
                                      // height: 227,
                                      fit: BoxFit.fill,
                                    ),
                              Container(
                                width: double.infinity,
                                height: 90,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Text(
                                "Lihat Lainnya",
                                style: TextCollection().bodySmall.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // "Rp.3.000.000.000,00",
                            // "Rp. 3 Miliar",
                            warehouseData!['name'].toString(),
                            // "Rp. ${formatter.format(warehouseData!['annualPrice'])}/Tahun",
                            // warehouseData!['annualPrice'].toString(),
                            style: TextCollection().bodyLarge,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp. ${formatter.format(warehouseData!['annualPrice'])}/Tahun",
                                style: TextCollection().bodyNormal,
                              ),
                              Container(
                                // width: 60,
                                // height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),

                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Gudang ${capitalizeFirstLetter(warehouseData!['warehouseType'])}',
                                    // warehouseData!['warehouseType'],
                                    style: TextCollection().bodySmall.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 18),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                warehouseData!['regencyName'].toString(),
                                // "Sudirman, Bandung",
                                style: TextCollection()
                                    .bodySmall
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Text(
                          //   "Gudang ${warehouseData!['warehouseType']}",
                          //   // warehouseData!['warehouseType'].toString(),
                          //   // "Gudang",
                          //   style: TextCollection()
                          //       .bodySmall
                          //       .copyWith(fontWeight: FontWeight.normal),
                          // ),
                          const SizedBox(height: 15),
                          Text(
                            // warehouseData!['name'].toString(),
                            "Deskripsi",
                            style: TextCollection()
                                .bodySmall
                                .copyWith(color: colorApp.mainColor),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            warehouseData!['description'].toString(),
                            // "Siap Pakai, akses mudah, serta bangunan kokoh. lokasi cukup strategis, daerah Bandung",
                            style: TextCollection().bodySmall.copyWith(
                                color: colorApp.mainColor,
                                fontWeight: FontWeight.normal),
                          ),
                          ListTile(
                            onTap: () {
                              Get.to(
                                WarehouseMapScreen(
                                  lat: warehouseData!['latitude'],
                                  long: warehouseData!['longitude'],
                                  name: warehouseData!['name'],
                                ),
                              );
                            },
                            leading: Icon(
                              Icons.location_on_outlined,
                              color: colorApp.mainColor,
                            ),
                            title: Text(
                              "Lokasi",
                              style: TextCollection().bodySmall.copyWith(
                                    color: colorApp.mainColor,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_right_outlined,
                              color: colorApp.mainColor,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 85,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              zoomControlsEnabled: false,
                              onMapCreated: (controller) {
                                setState(() {
                                  mapController = controller;
                                });
                              },
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  warehouseData!["latitude"],
                                  warehouseData!["longitude"],
                                ),
                                zoom: 10.0,
                              ),
                              markers: <Marker>{
                                Marker(
                                  markerId: const MarkerId("warehouse_marker"),
                                  position: LatLng(
                                    warehouseData!["latitude"],
                                    warehouseData!["longitude"],
                                  ),
                                )
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Informasi Properti",
                            style: TextCollection()
                                .bodySmall
                                .copyWith(color: colorApp.mainColor),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tipe Properti",
                                style: TextCollection().bodySmall.copyWith(
                                    color: colorApp.mainColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                // "Gudang",
                                "${warehouseData!['warehouseType']}",

                                style: TextCollection().bodySmall.copyWith(
                                    color: colorApp.mainColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Luas Tanah",
                                style: TextCollection().bodySmall.copyWith(
                                    color: colorApp.mainColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                // "1034 m2",
                                " ${warehouseData!['surfaceArea'].toString()} m²",

                                style: TextCollection().bodySmall.copyWith(
                                    color: colorApp.mainColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Luas Bangunan",
                                style: TextCollection().bodySmall.copyWith(
                                    color: colorApp.mainColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                // "10098 m2",
                                " ${warehouseData!['buildingArea'].toString()} m²",
                                style: TextCollection().bodySmall.copyWith(
                                    color: colorApp.mainColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorApp().mainColor,
                    width: double.infinity,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorApp.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () async {
                          WarehouseModel selectedWarehouse = WarehouseModel(
                              warehouseId: widget.warehouseId,
                              name: warehouseData!['name'].toString(),
                              regencyName:
                                  warehouseData!['regencyName'].toString(),
                              weeklyPrice: warehouseData!['weeklyPrice'],
                              monthlyPrice: warehouseData!['monthlyPrice'],
                              annuallyPrice: warehouseData!['annualPrice'],
                              image: warehouseData!['image']);
                          // await Get.delete<WarehouseController>(force: true);
                          // if (warehouseCont
                          //         .selectedWarehouse.value.warehouseId ==
                          //     0) {
                          //   setSelectedWarehouseState();
                          // } else {
                          // setSelectedWarehouseState();
                          // }

                          Get.to(() => PengajuanSewa(
                                selectedWarehouse: selectedWarehouse,
                              ));
                        },
                        child: Text(
                          'Ajukan Sewa',
                          style: TextCollection().bodySmall.copyWith(
                                color: colorApp.light4,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
