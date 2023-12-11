import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/mywarehouse_cont.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:capstone_wms/services/mywarehouse_services.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/screens/main/my_warehouse/detail_my_warehouse_screen.dart';
import 'package:get/get.dart';

class MyWarehouse extends StatefulWidget {
  const MyWarehouse({Key? key}) : super(key: key);

  @override
  State<MyWarehouse> createState() => _MyWarehouseState();
}

class _MyWarehouseState extends State<MyWarehouse> {
  TextCollection textApp = TextCollection();
  // MyWarehouseServices myWarehouseService = MyWarehouseServices();
  MyWarehouseController myWarehouseCont = Get.put(MyWarehouseController());

  @override
  void initState() {
    super.initState();
    myWarehouseCont.getSubmittedData();
    myWarehouseCont.getRentedData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // leading: ,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Gudangku',
              style: textApp.heading6,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TabBar(
                labelColor: colorApp.mainColor,
                unselectedLabelColor: Colors.black,
                indicatorColor: colorApp.mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Disewa',
                      style: textApp.bodyNormal
                          .copyWith(color: const Color(0xFF0063F7)),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Diajukan',
                      style: textApp.bodyNormal
                          .copyWith(color: const Color(0xFF0063F7)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Konten untuk tab "Disewa"
                    Obx(() => FutureBuilder<List<dynamic>?>(
                        future: myWarehouseCont.acceptedWarehouse.isNotEmpty
                            ? Future.value(myWarehouseCont.acceptedWarehouse)
                            : null,
                        builder: (context, snapshot) {
                          if (myWarehouseCont.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: colorApp.mainColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.data == null ||
                              myWarehouseCont.acceptedWarehouse.isEmpty) {
                            return Center(
                              child: Text('Gudang Tidak Ditemukan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400)),
                            );
                          } else {
                            return ListView.builder(
                              itemCount:
                                  myWarehouseCont.acceptedWarehouse.length,
                              itemBuilder: (context, index) {
                                // final item = warehouseData[index];
                                var acceptedWarehouse =
                                    myWarehouseCont.acceptedWarehouse[index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => DetailMyWarehouseScreen(
                                          warehouseId:
                                              acceptedWarehouse['warehouseId'],
                                          transactionId: acceptedWarehouse[
                                              'transactionId'],
                                        ));
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Container(
                                      // color: colorApp.dark1,
                                      // margin: const EdgeInsets.only(bottom: 16),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      //child: Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            height: 87,
                                            width: 108,

                                            // width: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Image.network(
                                                  'https://th.bing.com/th?id=OIP.jIg6qxA83ebRm-TqLPDO0QHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2',
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  acceptedWarehouse[
                                                      'warehouseName'],
                                                  style: textApp.bodyNormal
                                                      .copyWith(
                                                          color: colorApp
                                                              .mainColorDarker),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      acceptedWarehouse[
                                                          'warehouseRegency'],
                                                      style: textApp.bodySmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    const SizedBox(
                                                      width: 60,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  '${acceptedWarehouse['buildingArea']} m²',
                                                  style: textApp.bodySmall
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        })),
                    // Konten untuk tab "Diajukan"
                    Obx(() => FutureBuilder<List<dynamic>?>(
                        future: myWarehouseCont.submittedWarehouse.isNotEmpty
                            ? Future.value(myWarehouseCont.submittedWarehouse)
                            : null,
                        builder: (context, snapshot) {
                          if (myWarehouseCont.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: colorApp.mainColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.data == null ||
                              myWarehouseCont.submittedWarehouse.isEmpty) {
                            return Center(
                              child: Text('Gudang Tidak Ditemukan',
                                  style: textApp.bodySmall
                                      .copyWith(fontWeight: FontWeight.w400)),
                            );
                          } else {
                            return ListView.builder(
                              itemCount:
                                  myWarehouseCont.submittedWarehouse.length,
                              itemBuilder: (context, index) {
                                // final item = warehouseData[index];
                                var submittedWarehouse =
                                    myWarehouseCont.submittedWarehouse[index];
                                return InkWell(
                                  onTap: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return DetailMyWarehouseScreen(
                                    //       warehouseData: submittedWarehouse);
                                    // }));
                                    // Get.to(() => DetailMyWarehouseScreen(
                                    //     warehouseId:
                                    //         submittedWarehouse['warehouseId']));
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Container(
                                      // color: colorApp.dark1,
                                      // margin: const EdgeInsets.only(bottom: 16),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      //child: Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            height: 87,
                                            width: 108,

                                            // width: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Image.network(
                                                  'https://th.bing.com/th?id=OIP.jIg6qxA83ebRm-TqLPDO0QHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2',
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  submittedWarehouse[
                                                      'warehouseName'],
                                                  style: textApp.bodyNormal
                                                      .copyWith(
                                                          color: colorApp
                                                              .mainColorDarker),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      submittedWarehouse[
                                                          'warehouseRegency'],
                                                      style: textApp.bodySmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    const SizedBox(
                                                      width: 60,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  '${submittedWarehouse['buildingArea']} m²',
                                                  style: textApp.bodySmall
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
