import 'package:flutter/material.dart';
import 'package:capstone_wms/widget/warehouse_disewa_item.dart';

class DetailMyWarehouseScreen extends StatefulWidget {
  final Map<String, dynamic> warehouseData;

  const DetailMyWarehouseScreen({Key? key, required this.warehouseData})
      : super(key: key);

  @override
  State<DetailMyWarehouseScreen> createState() =>
      _DetailMyWarehouseScreenState();
}

class _DetailMyWarehouseScreenState extends State<DetailMyWarehouseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Warehouse Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 16,
            ),
            WarehouseItem(item: widget.warehouseData),
          ],
        ),
      ),
    );
  }
}
