import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/main.dart';
import 'package:capstone_wms/screens/main/chatbot/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/chats_provider.dart';
import '../services/ai_handler.dart';

import 'toggle_button.dart';

enum InputMode { text }

class ChatTextField extends ConsumerStatefulWidget {
  const ChatTextField({super.key});

  @override
  ConsumerState<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  InputMode _inputMode = InputMode.text;
  final _messageController = TextEditingController();
  final AIHandler _openAI = AIHandler();
  var _isReplying = false;
  var _isListening = false;

  @override
  void initState() {
    AIHandler();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextCollection textApp = TextCollection();
    return Container(
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
                      controller: _messageController,
                      onChanged: (value) {
                        value.isNotEmpty
                            ? setInputMode(InputMode.text)
                            : setInputMode(InputMode.text);
                      },
                      cursorColor: Theme.of(context).colorScheme.onPrimary,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: colorApp.light2,
                        suffixIcon: SizedBox(
                          child: ToggleButton(
                            isListening: _isListening,
                            isReplying: _isReplying,
                            inputMode: _inputMode,
                            sendTextMessage: () {
                              final message = _messageController.text;
                              _messageController.clear();
                              sendTextMessage(message);
                            },
                          ),
                        ),
                        hintText: "Ketik pesanmu disini...",
                        hintStyle: textApp.smallLabel.copyWith(
                          color: colorApp.mainColor,
                          fontSize: 13,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorApp.light2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorApp.light2),
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
    );
  }

  void setInputMode(InputMode inputMode) {
    setState(() {
      _inputMode = inputMode;
    });
  }

  void sendTextMessage(String message) async {
    setReplyingState(true);
    addToChatList(message, true, DateTime.now().toString());
    addToChatList('Typing...', false, 'typing');
    setInputMode(InputMode.text);
    final aiResponse = await _openAI.getResponse(message);
    removeTyping();
    addToChatList(aiResponse, false, DateTime.now().toString());
    setReplyingState(false);
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void setListeningState(bool isListening) {
    setState(() {
      _isListening = isListening;
    });
  }

  void removeTyping() {
    final chats = ref.read(chatsProvider.notifier);
    chats.removeTyping();
  }

  void addToChatList(String message, bool isMe, String id) {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(ChatModel(
      id: id,
      message: message,
      isMe: isMe,
    ));
  }
}
