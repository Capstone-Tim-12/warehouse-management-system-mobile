import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileServices {

  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> getUserInfo(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<http.Response> updateUserEmail(String token, String newEmail) async {
    final response = await http.put(Uri.parse('$baseUrl/user/profile/email'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'email': newEmail}));

    return response;
  }

  Future<http.Response> updateUserName(String token, String newUsername) async {
    final response = await http.put(
      Uri.parse('$baseUrl/user/profile/username'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'username': newUsername}),
    );

    return response;
  }

  Future<Response<dynamic>> uploadFoto(String token, XFile foto) async {
    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(
          foto.path,
          filename: foto.path,
        ),
      });

      Response<dynamic> response = await dio.post(
        '$baseUrl/user/upload/photo',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (error) {
      print('Error uploading photo: $error');
      rethrow;
    }
  }

  // Future<http.Response> uploadFoto(String token, dynamic foto) async {
  //   final response = await http.post(Uri.parse('$baseUrl/user/upload/photo'),
  //       headers: {
  //         "Content-Type": "multipart/form-data",
  //         'Authorization': 'Bearer $token',
  //       },
  //       // body: jsonEncode({'photo': foto}));
  //       // body: MultipartFile.fromBytes('file', await foto.value.readAsBytes(), foto.value.name));
  //       body: FormData.fromMap({
  //         'photo': await MultipartFile.fromFile(foto.value.path,
  //             filename: foto.value.name)
  //       }));

  //   return response;
  // }

  Future<http.Response> updateProfilePic(String token, String imageUrl) async {
    final response = await http.put(Uri.parse('$baseUrl/user/profile/photo'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'urlImage': imageUrl}));

    return response;
  }
}
