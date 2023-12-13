import 'dart:convert';

import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
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

bool isLoading = false;
final formatter = NumberFormat("#,###");
late GoogleMapController mapController;
// late LatLng warehouseLatLng;

// late Future<List<dynamic>> warehouseData;
//List<dynamic>? detailWarehouseId;
List<dynamic>? detailWarehouseId;

class _DetailGudangScreenState extends State<DetailGudangScreen> {
  // List<dynamic>? detailgudang;
  Map<String, dynamic>? warehouseData;
  List<String>? imageUrls;
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

          // detailgudang = warehouseList;
        });
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Detail Gudang",
          style: TextCollection().heading5,
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      'https://picsum.photos/300/200?random=4',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            'https://picsum.photos/300/200?random=1',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            'https://picsum.photos/300/200?random=3',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            print('sudah ditekan');
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.network(
                                'https://picsum.photos/300/200?random=2',
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
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Rp.3.000.000.000,00",
                                    // "Rp. 3 Miliar",
                                    // warehouseData!['annualPrice'].toString(),
                                    warehouseData!['name'].toString(),
                                    style: TextCollection().bodyNormal,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Rp. ${formatter.format(warehouseData!['annualPrice'])}/Tahun",
                                    style: TextCollection().bodyNormal,
                                  ),
                                ],
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorApp().mainColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${warehouseData!['warehouseType']}",
                                      style:
                                          TextCollection().bodySmall2.copyWith(
                                                color: Colors.white,
                                              ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            warehouseData!['regencyName'].toString(),
                            // "Sudirman, Bandung",
                            style: TextCollection()
                                .bodySmall
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Gudang ${warehouseData!['warehouseType']}",
                            // warehouseData!['warehouseType'].toString(),
                            // "Gudang",
                            style: TextCollection()
                                .bodySmall
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
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
                        onPressed: () {
                          print("sudah ditekan");
                        },
                        child: Text(
                          'Sewa Gudang',
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
