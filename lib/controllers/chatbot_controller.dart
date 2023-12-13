import 'dart:convert';

import 'package:capstone_wms/screens/main/chatbot/model/openai_model.dart';
import 'package:capstone_wms/services/chatbot_services.dart';
import 'package:capstone_wms/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotController extends GetxController {
  ChatbotServices chatbot = ChatbotServices();
  FirebaseServices firebase = FirebaseServices();
  final currentTimestamp = Timestamp.now();

  RxBool isLoading = false.obs;
  RxBool isSending = false.obs;
  RxMap userInfo = {}.obs;
  RxInt userId = 0.obs;
  RxInt messageIndex = 1.obs;

  RxString botResponse = ''.obs;

  Future<void> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    userInfo.clear();

    try {
      final response = await chatbot.getUserId(prefs.getString('token')!);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        userInfo.value = await responseData['data'];
        if (userInfo.isNotEmpty) {
          userId.value = await userInfo['id'];
        }
        // userId.value == responseData['data']['id'];
        print(userId.value);
      } else {
        Get.snackbar("Peringatan", responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetChatBot() async {
    try {
      await firebase.resetChatByUserId(userId.value);
      messageIndex.value = 1;
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage(String message, Timestamp sentTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSending.value = true;
    String token = prefs.getString('token')!;

    try {
      await firebase.saveUserMessage(
          message, userId.value, sentTime, messageIndex.value);
      // final responsefromAPi = await chatbot.getResponse(prompt: message);
      final responsefromAPi = await chatbot.sendMessage(token, message);
      Map<String, dynamic> responseData = jsonDecode(responsefromAPi.body);

      if (responsefromAPi.statusCode == 200) {
        String responsebot = responseData['data']['text'];
        // Future.delayed(const Duration(seconds: 1)).then((value) =>
        //     firebase.saveBotMessage(botResponse, userId.value, sentTime));
        botResponse.value = responsebot;
        if (botResponse.isNotEmpty) {
          firebase.saveBotMessage(botResponse.value, userId.value,
              currentTimestamp, messageIndex.value + 1);
        }
        // firebase.saveBotMessage(botResponse, userId.value, sentTime);
      } else {
        Get.snackbar("Peringatan", responseData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isSending.value = false;
      messageIndex.value = messageIndex.value + 2;
    }
  }

  Future<void> sendChatMessage(String message, Timestamp sentTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSending.value = true;
    String token = prefs.getString('token')!;

    try {
      await firebase.saveUserMessage(
          message, userId.value, sentTime, messageIndex.value);
      final GptData responsefromAPi =
          await chatbot.getResponse(prompt: message);
      // final responsefromAPi = await chatbot.sendMessage(token, message);
      // Map<String, dynamic> responseData = jsonDecode(responsefromAPi.body);
      // final GptData gptResponseData =

      if (responsefromAPi.choices[0].message.content.isNotEmpty) {
        String responsebot = responsefromAPi.choices[0].message.content;
        botResponse.value = responsebot;
        if (botResponse.isNotEmpty) {
          firebase.saveBotMessage(botResponse.value, userId.value,
              currentTimestamp, messageIndex.value + 1);
          // .then((value) => messageIndex.value + 2);
        }
        // firebase.saveBotMessage(botResponse, userId.value, sentTime);
      } else {
        Get.snackbar("Peringatan", 'something went wrong');
      }
    } catch (e) {
      print(e);
    } finally {
      isSending.value = false;
      messageIndex.value = messageIndex.value + 2;
    }
  }
}
