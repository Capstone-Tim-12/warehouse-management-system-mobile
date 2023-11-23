import 'package:flutter/material.dart';

class WarehouseItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const WarehouseItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  item['imageUrl'],
                  fit: BoxFit.cover,
                ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(item['lokasiGudang']),
                    const SizedBox(
                      width: 40,
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
  }
}
