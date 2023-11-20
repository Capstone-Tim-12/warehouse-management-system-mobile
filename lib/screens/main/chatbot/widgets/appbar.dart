import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextCollection textApp = TextCollection();

    return AppBar(
        leading: IconButton(
            color: colorApp.light4,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            )),
        leadingWidth: 80,
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorApp.mainColor,
        title: Column(
          children: [
            Text(
              "Chat with",
              style: textApp.extraSmallLabel.copyWith(
                color: colorApp.light4,
                fontSize: 17,
              ),
            ),
            Text(
              "DigiHouse Bot",
              style: textApp.bodyLarge.copyWith(
                color: colorApp.light4,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image/chatbot.jpg'),
              radius: 25,
            ),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
