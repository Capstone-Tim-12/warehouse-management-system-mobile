import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:flutter/material.dart';
import 'package:capstone_wms/screens/main/my_warehouse/detail_my_warehouse_screen.dart';

class MyWarehouse extends StatefulWidget {
  const MyWarehouse({Key? key}) : super(key: key);

  @override
  State<MyWarehouse> createState() => _MyWarehouseState();
}

class _MyWarehouseState extends State<MyWarehouse> {
  List<Map<String, dynamic>> warehouseData = [
    {
      'imageUrl':
          'https://th.bing.com/th?id=OIP.jIg6qxA83ebRm-TqLPDO0QHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2',
      'namaGudang': 'Nama Gudang 1',
      'lokasiGudang': 'Lokasi Gudang 1',
      'proses': 'Proses 1',
      'luasGudang': 'Luas Gudang 1',
    },
    {
      'imageUrl':
          'https://th.bing.com/th?id=OIP.jIg6qxA83ebRm-TqLPDO0QHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2',
      'namaGudang': 'Nama Gudang 2',
      'lokasiGudang': 'Lokasi Gudang 2',
      'proses': 'Proses 2',
      'luasGudang': 'Luas Gudang 2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Warehouse'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                color: Colors.grey, // Warna divider
                height: 1.0, // Tinggi divider
              ),
              const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.blue,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Disewa',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Diajukan',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    ListView.builder(
                      itemCount: warehouseData.length,
                      itemBuilder: (context, index) {
                        final item = warehouseData[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailMyWarehouseScreen(
                                  warehouseData: item);
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Card(
                              elevation: 4,
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(item['imageUrl']),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['namaGudang'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(item['lokasiGudang']),
                                          const SizedBox(
                                            width: 60,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(item['luasGudang']),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // Konten untuk tab "Diajukan"
                    ListView.builder(
                      itemCount: warehouseData.length,
                      itemBuilder: (context, index) {
                        final item = warehouseData[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(color: colorApp.light1),
                          child: Card(
                            elevation: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(item['imageUrl']),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['namaGudang'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(item['lokasiGudang']),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(item['luasGudang']),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    item['proses'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
