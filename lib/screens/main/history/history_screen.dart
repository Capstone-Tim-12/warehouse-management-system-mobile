import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();

  // Sample data for the cards
  List<Map<String, dynamic>> cardData = [
    {
      'warehouse': 'Warehouse Kita',
      'imageURL':
          'https://4.bp.blogspot.com/-t9_rdjctpxQ/VyQ4R3LhjBI/AAAAAAAAC6w/uIw1NzgB9rkDiCy1NWjAJFvNBGaTlGIqgCLcB/s1600/Gudang.jpg',
      'price': 'Rp 20.000.000/bulan',
      'location': 'Jakarta Barat',
      'duration': '3 Minggu',
      'entryDate': '1 Agustus 2023',
      'exitDate': '13 Agustus 2023',
      'total': 'Rp 20.000.000',
    },
    {
      'warehouse': 'Adhimetal Group',
      'imageURL':
          'https://4.bp.blogspot.com/-t9_rdjctpxQ/VyQ4R3LhjBI/AAAAAAAAC6w/uIw1NzgB9rkDiCy1NWjAJFvNBGaTlGIqgCLcB/s1600/Gudang.jpg',
      'price': 'Rp 20.000.000/bulan',
      'location': 'Jakarta Barat',
      'duration': '3 Minggu',
      'entryDate': '1 Agustus 2023',
      'exitDate': '13 Agustus 2023',
      'total': 'Rp 20.000.000',
    },
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat',
          style: textApp.heading6,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffFF7733),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: cardData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                buildCard(cardData[index]),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildCard(Map<String, dynamic> data) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Set the border color
            width: 1, // Set the border width
          ),
          borderRadius: BorderRadius.circular(10.0), // Set border radius
        ),
        child: InkWell(
          onTap: () {
            // Handle tap if needed
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['warehouse'],
                      style: textApp.bodySmall2,
                    ),
                    Text('Selesai'),
                  ],
                ),
                Divider(thickness: 2),
                Row(
                  children: [
                    Image.network(
                      data['imageURL'],
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['price']),
                          SizedBox(height: 12),
                          Text(data['location']),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Durasi Sewa'),
                              Text(data['duration']),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tanggal Masuk'),
                              Text(data['entryDate']),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tanggal Keluar'),
                              Text(data['exitDate']),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: textApp.bodySmall2,
                    ),
                    Text(
                      data['total'],
                      style: textApp.bodySmall2,
                    )
                  ],
                ),
                Divider(thickness: 2),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff17345F)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Atur radius sesuai kebutuhan
                            ),
                          ),
                        ),
                        child: Text(
                          'Sewa Lagi',
                          style: textApp.label1,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
