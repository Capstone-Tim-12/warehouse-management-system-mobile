// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class MyWarehouse extends StatefulWidget {
//   const MyWarehouse({Key? key}) : super(key: key);

//   @override
//   State<MyWarehouse> createState() => _MyWarehouseState();
// }

// class _MyWarehouseState extends State<MyWarehouse> {
//   List<Map<String, dynamic>> warehouseData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Ambil data dari endpoint saat widget diinisialisasi.
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('URL_ENDPOINT'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         warehouseData = List<Map<String, dynamic>>.from(data);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('My Warehouse'),
//           bottom: const TabBar(
//             labelColor: Colors.blue,
//             unselectedLabelColor: Colors.black,
//             indicatorColor: Colors.blue,
//             tabs: <Widget>[
//               Tab(
//                 child: Text(
//                   'Disewa',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               ),
//               Tab(
//                 child: Text(
//                   'Diajukan',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Konten untuk tab "Disewa"
//             Padding(
//               padding: const EdgeInsets.all(24),
//               child: ListView.builder(
//                 itemCount: warehouseData.length,
//                 itemBuilder: (context, index) {
//                   final item = warehouseData[index];
//                   return Card(
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 100,
//                           width: 100,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12.0),
//                             child: Image.network(
//                                 'https://th.bing.com/th?id=OIP.ag2vmB8TqSKkuhWnS5roqgHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2'),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 12,
//                         ),
//                         const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'namaGudang',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 12,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text('lokasiGudang'),
//                                 SizedBox(
//                                   width: 74,
//                                 ),
//                                 Text(
//                                   'proses',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.amber,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 12,
//                             ),
//                             Text('luasGudang'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Konten untuk tab "Diajukan"
//             Padding(
//               padding: const EdgeInsets.all(24),
//               child: ListView.builder(
//                 itemCount: warehouseData.length,
//                 itemBuilder: (context, index) {
//                   final item = warehouseData[index];
//                   return Card(
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 100,
//                           width: 100,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12.0),
//                             child: Image.network(
//                                 'https://th.bing.com/th?id=OIP.ag2vmB8TqSKkuhWnS5roqgHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2'),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 12,
//                         ),
//                         const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'namaGudang',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 12,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text('lokasiGudang'),
//                                 SizedBox(
//                                   width: 74,
//                                 ),
//                                 Text(
//                                   'proses',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.amber,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 12,
//                             ),
//                             Text('luasGudang'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

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
          bottom: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Disewa',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  'Diajukan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Konten untuk tab "Disewa"
            Padding(
              padding: const EdgeInsets.all(24),
              child: ListView.builder(
                itemCount: warehouseData.length,
                itemBuilder: (context, index) {
                  final item = warehouseData[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Card(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                  );
                },
              ),
            ),
            // Konten untuk tab "Diajukan"
            Padding(
              padding: const EdgeInsets.all(24),
              child: ListView.builder(
                itemCount: warehouseData.length,
                itemBuilder: (context, index) {
                  final item = warehouseData[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Card(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Text(
                                    item['proses'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 16,
                                    ),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
