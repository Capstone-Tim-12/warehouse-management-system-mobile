import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/chatbot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextCollection textApp = TextCollection();
    ChatbotController chatbot = Get.put(ChatbotController());

    return AppBar(
        leading: IconButton(
            color: colorApp.light4,
            onPressed: () async {
              await chatbot.resetChatBot();
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            )),
        leadingWidth: 80,
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorApp.mainColor,
        title: Obx(
          () => Column(
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
              if (chatbot.isSending.value)
                Text(
                  'Bot sedang mengetik...',
                  style: textApp.bodySmall.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
            ],
          ),
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
