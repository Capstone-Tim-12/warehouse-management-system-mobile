import 'package:flutter/material.dart';

class MyWarehouse extends StatefulWidget {
  const MyWarehouse({super.key});

  @override
  State<MyWarehouse> createState() => _MyWarehouseState();
}

class _MyWarehouseState extends State<MyWarehouse> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [Text('my warehouse')],
      ),
    );
  }
}