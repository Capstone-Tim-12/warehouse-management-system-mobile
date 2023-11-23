import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/main/chatbot/Widgets/appbar.dart';
import 'package:capstone_wms/screens/main/chatbot/providers/chat_provider.dart';
import 'package:capstone_wms/screens/main/chatbot/widgets/chatbox.dart';
import 'package:capstone_wms/screens/main/chatbot/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorApp.light2,
        appBar: MyAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final chats = ref.watch(chatsProvider).reversed.toList();
                return ListView.builder(
                  reverse: true,
                  itemCount: chats.length,
                  itemBuilder: (context, index) => ChatItem(
                    text: chats[index].message,
                    isMe: chats[index].isMe,
                  ),
                );
              }),
            ),
            ChatTextField(),
          ],
        ));
  }
}
