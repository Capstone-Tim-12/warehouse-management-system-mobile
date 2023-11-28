import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class DetailGudangScreen extends StatefulWidget {
  const DetailGudangScreen({super.key});

  @override
  State<DetailGudangScreen> createState() => _DetailGudangScreenState();
}

class _DetailGudangScreenState extends State<DetailGudangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: colorApp.dark4,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Detail Gudang",
          style: TextCollection().heading5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                'https://picsum.photos/300/200?random=4',
                fit: BoxFit.cover,
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
                      fit: BoxFit.cover,
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
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print('sudah ditekan');
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          'https://picsum.photos/300/200?random=2',
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: double.maxFinite,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: const Text("Lihat Lainnya"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10),
            )
          ],
        ),
      ),
    );
  }
}
