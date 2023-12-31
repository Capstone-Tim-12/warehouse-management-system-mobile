import 'dart:io';

import 'package:camera/camera.dart';
import 'package:capstone_wms/models/user_model.dart';
import 'package:capstone_wms/models/virtualaccount_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseServices extends GetxController {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference paymentCollection =
      FirebaseFirestore.instance.collection('paymentHistory');

  final CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  final currentTimestamp = Timestamp.now();

  Future<void> addTransaction(VirtualAccountModel param) async {
    await paymentCollection.add({
      'vaName': param.vaName,
      'vaNumber': param.vaNumber,
      'xPaymentId': param.xPaymentId,
      'bankCode': param.bankCode,
      'nominal': param.nominal,
      'expiredAt': param.expiredAt
    });
  }

  Future<void> resetChatByUserId(int userId) async {
    try {
      CollectionReference messages =
          FirebaseFirestore.instance.collection('messages');
      QuerySnapshot querySnapshot =
          await messages.where('userId', isEqualTo: userId).get();
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        await document.reference.delete();
      }
      print('Chat for userId $userId reset successfully');
    } catch (e) {
      print('Error resetting chat: $e');
    }
  }

  Future<void> saveUserMessage(String message, int userId, Timestamp create,
      int userMessageIndex) async {
    await messagesCollection.add({
      'userId': userId,
      'role': 'user',
      'message': message,
      'createdAt': create,
      'index': userMessageIndex
    });
  }

  Future<void> saveBotMessage(
      String message, int userId, Timestamp create, int botMessageindex) async {
    await messagesCollection.add({
      'userId': userId,
      'role': 'bot',
      'message': message,
      'createdAt': create,
      'index': botMessageindex
    });
  }

  Future<void> addUser(UserModel usermodel) async {
    await userCollection.add({
      'userId': usermodel.userId,
      'email': usermodel.email,
      'name': usermodel.name,
      'picKTP': usermodel.picKTP,
      'selKTP': usermodel.selKTP,
      'verified': false
    });
  }

  Future<void> verifyUser(UserModel usermodel) async {
    await userCollection.doc(usermodel.id).update({
      'userId': usermodel.userId,
      'email': usermodel.email,
      'name': usermodel.name,
      'picKTP': usermodel.picKTP,
      'selKTP': usermodel.selKTP,
      'verified': true
    });
  }

  Future<bool> checkUserExists(int userId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  Future<String?> getEmailForUID(String uid) async {
    try {
      QuerySnapshot querySnapshot =
          await userCollection.where('uid', isEqualTo: uid).get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first['email'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving email: $e');
      return null;
    }
  }

  Future<String?> getUserDocumentID(int uid) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('userId', isEqualTo: uid)
        .get();

    return snapshot.docs.first.id;
  }

  Future<bool> isMessageSent(int uid, Timestamp timecek) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('messages')
        .where('createdAt', isEqualTo: timecek)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  Future<bool> checkUserIsVerified(int userid) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('userId', isEqualTo: userid)
        .where('verified', isEqualTo: true)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  Future<String?> uploadKTPToFirebaseStorage(XFile imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt('userId')!;
    String name = prefs.getString('name')!;
    String fileKTPName =
        "KTP_${name.toString()}_${DateTime.now().millisecondsSinceEpoch}.jpg";

    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('${userId.toString()}/KTP/$fileKTPName');

      UploadTask uploadTask = storageReference.putFile(File(imageFile.path));

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      print(downloadUrl);

      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<String?> uploadSelfieKTPToFirebaseStorage(XFile imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt('userId')!;
    String name = prefs.getString('name')!;
    String fileKTPName =
        "SelfieKTP_${name.toString()}_${DateTime.now().millisecondsSinceEpoch}.jpg";

    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('${userId.toString()}/KTP/$fileKTPName');

      UploadTask uploadTask = storageReference.putFile(File(imageFile.path));

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      print(downloadUrl);

      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}
