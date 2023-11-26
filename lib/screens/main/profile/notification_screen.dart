import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: textCollection.heading6,
        ),
        backgroundColor: colorApp.light3,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () {},
        ),
      )
      );
  }
}