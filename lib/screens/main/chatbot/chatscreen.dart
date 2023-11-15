import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/main/chatbot/Constant/API_Key.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();

  final _openAI = OpenAI.instance.build(
    token: apiKey,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 100000),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: "Avatar",
    lastName: "Main",
    profileImage: "",
  );
  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: "DigiHouse Bot",
    profileImage: 'assets/image/chatbot.jpg',
  );

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              color: colorApp.light4,
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
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
          ]),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: DashChat(
              currentUser: _currentUser,
              typingUsers: _typingUsers,
              messageOptions: MessageOptions(
                showCurrentUserAvatar: true,
                currentUserTextColor: Colors.black,
                currentUserContainerColor: colorApp.secondaryColor,
                containerColor:const Color(0xffD9D9D9),
                textColor: Colors.black,
              ),
              inputOptions: InputOptions(
                textInputAction: TextInputAction.send,
                textCapitalization: TextCapitalization.characters,
                autocorrect: true,
                inputTextStyle: const TextStyle(color: Colors.black),
                alwaysShowSend: true,
                sendButtonBuilder: (send) {
                  return IconButton(
                    icon: Icon(
                      Icons.send,
                      color: colorApp.secondaryColor,
                    ),
                    onPressed: send,
                  );
                },
                inputDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "Ketik pesanmu disini...",
                  hintStyle: TextStyle(color: colorApp.dark3, fontSize: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              onSend: (ChatMessage m) {
                getChatResponse(m);
              },
              messages: _messages,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              color: colorApp.mainColor,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: DashChat(
                  currentUser: _currentUser,
                  typingUsers: _typingUsers,
                  inputOptions: InputOptions(
                    cursorStyle: const CursorStyle(color: Colors.white),
                    inputToolbarPadding: const EdgeInsets.only(bottom: 10),
                    textInputAction: TextInputAction.send,
                    textCapitalization: TextCapitalization.characters,
                    autocorrect: true,
                    inputTextStyle: textApp.normalLabel.copyWith(
                      color: colorApp.light1,
                      fontSize: 15,
                    ),
                    alwaysShowSend: true,
                    sendButtonBuilder: (send) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 15, right: 10.0, bottom: 5),
                        child: ElevatedButton(
                            onPressed: send,
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(12),
                              backgroundColor: Colors.white,
                            ),
                            child: Icon(
                              Icons.send,
                              color: colorApp.mainColor,
                            )),
                      );
                    },
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintText: "Ketik pesanmu disini...",
                      hintStyle: textApp.smallLabel.copyWith(
                        color: colorApp.light1,
                        fontSize: 15,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: colorApp.mainColor), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: colorApp.mainColor), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                  onSend: (ChatMessage m) {
                    getChatResponse(m);
                  },
                  messages: _messages,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });
    List<Messages> _messagesHistory = _messages.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: _messagesHistory,
      maxToken: 300,
    );
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
                user: _gptChatUser,
                createdAt: DateTime.now(),
                text: element.message!.content),
          );
        });
      }
    }
    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}
