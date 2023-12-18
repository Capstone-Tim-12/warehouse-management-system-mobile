import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/chatbot_controller.dart';
import 'package:capstone_wms/screens/main/chatbot/Widgets/appbar.dart';
import 'package:capstone_wms/screens/main/chatbot/providers/chat_provider.dart';
import 'package:capstone_wms/screens/main/chatbot/widgets/bubblechat.dart';
import 'package:capstone_wms/screens/main/chatbot/widgets/chatbox.dart';
import 'package:capstone_wms/screens/main/chatbot/widgets/sendbutton.dart';
import 'package:capstone_wms/screens/main/chatbot/widgets/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();
  ChatbotController chatbotCont = Get.put(ChatbotController());
  TextEditingController messageCont = TextEditingController();

  // int messageIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // chatbotCont.getUserId();
    setState(() {});
    // print(chatbotCont.userId);
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> streamMessage = FirebaseFirestore.instance
        .collection('messages')
        .where('userId', isEqualTo: chatbotCont.userId.value)
        .orderBy('index')
        // .orderBy(FieldPath.documentId, descending: true)
        .snapshots();

    return Scaffold(
        backgroundColor: colorApp.light2,
        appBar: const MyAppBar(),
        body: Stack(
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: StreamBuilder<QuerySnapshot>(
                    stream: streamMessage,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      // if (snapshot.data?.docs == null ||
                      //     snapshot.data!.docs.isEmpty) {
                      //   // setState(() {});
                      //   return Center(
                      //       child: Text(
                      //     'Mulai Percakapan',
                      //     style: TextCollection()
                      //         .bodySmall
                      //         .copyWith(fontWeight: FontWeight.w400),
                      //   ));
                      // }

                      if (snapshot.hasError) {
                        return Center(
                            child: Text(
                          'SOmething Went Wrong',
                          style: TextCollection()
                              .bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: colorApp.mainColor),
                        );
                      }

                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                            child: Text(
                          'Mulai Percakapan',
                          style: TextCollection()
                              .bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ));
                      }
                      final currentTimestamp = Timestamp.now();

                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.78,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                var isUserMessage = data['role'] == 'user';
                                return BubbleChat(
                                    isUser: isUserMessage,
                                    message: data['message'],
                                    pfp: chatbotCont.userInfo['photo']);
                                // 'https://www.dropbox.com/scl/fi/zm4qf7xeh7ud25bbz89d2/file_McA1BYrVsSPEiGaruY6V.png?rlkey=dcyvrn8e3b0xvlhs2pqyevso6&raw=1');
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          )
                        ],
                      );

                      // List<DocumentSnapshot> documents = snapshot.data!.docs;
                      // List<Map<String, dynamic>> messages = documents
                      //     .map((doc) => doc.data() as Map<String, dynamic>)
                      //     .toList();

                      // return ListView.builder(
                      //     itemCount: messages.length,
                      //     itemBuilder: (context, index) {
                      //       var message = messages[index];
                      //       var isUserMessage = message['role'] == 'user';

                      //       return BubbleChat(
                      //           isUser: isUserMessage,
                      //           message: message['message'],
                      //           pfp:
                      //               'https://www.dropbox.com/scl/fi/zm4qf7xeh7ud25bbz89d2/file_McA1BYrVsSPEiGaruY6V.png?rlkey=dcyvrn8e3b0xvlhs2pqyevso6&raw=1');
                      //     });
                    }),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 10, top: 10),
                              child: SizedBox(
                                height: 45,
                                child: TextField(
                                  controller: messageCont,
                                  cursorColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 20),
                                    filled: true,
                                    fillColor: colorApp.light2,
                                    suffixIcon: SizedBox(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: colorApp.mainColor,
                                          foregroundColor: Colors.white,
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(1),
                                          minimumSize: const Size(50, 50),
                                          maximumSize: const Size(50, 50),
                                        ),
                                        onPressed: () {
                                          Timestamp currentTimestamp =
                                              Timestamp.now();
                                          chatbotCont.sendMessage(
                                              messageCont.text,
                                              currentTimestamp);
                                          // chatbotCont.sendChatMessage(
                                          //   messageCont.text,
                                          //   currentTimestamp,
                                          // );

                                          messageCont.clear();
                                        },
                                        child: const Icon(
                                          Icons.send,
                                        ),
                                      ),
                                    ),
                                    hintText: "Ketik pesanmu disini...",
                                    hintStyle: textApp.smallLabel.copyWith(
                                      color: colorApp.mainColor,
                                      fontSize: 13,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: colorApp.light2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: colorApp.light2),
                                      borderRadius: BorderRadius.circular(
                                        30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 06,
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
