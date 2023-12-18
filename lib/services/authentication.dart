import 'dart:convert';

import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:capstone_wms/controllers/userlocation_controller.dart';
import 'package:capstone_wms/models/userlocation_model.dart';
import 'package:capstone_wms/models/verifiyuser_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService {
  UserLocationController userLocationCont = Get.put(UserLocationController());

  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> logInUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {
        "Content-Type": "application/json",
        "longitude": "${userLocationCont.userLocation.value.longitude}",
        "latitude": "${userLocationCont.userLocation.value.latitude}"
      },
      body: json.encode({
        "email": email,
        "password": password,
      }),
    );

    return response;
  }

  // static Future<Map<String, dynamic>> logInUser(
  //     String email, String password) async {
  //   final response = await http.post(Uri.parse('$baseUrl/user/login'),
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode({
  //         "email": email,
  //         "password": password,
  //       }));

  //   if (response.statusCode == 200) {
  //     print('awoakwoak login berhasil cuy');
  //     print(response.statusCode);
  //     print(response.body);
  //     return Map<String, dynamic>.from(json.decode(response.body));
  //   } else {
  //     print(response.statusCode);
  //     print(response.body);
  //     throw Exception('Failed to log in');
  //   }
  // }

  Future<http.Response> registerUser(
      String userName, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/register'),
      headers: {
        "Content-Type": "application/json",
        "longitude": "${userLocationCont.userLocation.value.longitude}",
        "latitude": "${userLocationCont.userLocation.value.latitude}"
      }, // Set the Content-Type header
      body: json.encode({
        "username": userName,
        "email": email,
        "password": password,
      }),
    );

    return response;
  }

  // Future<Map<String, dynamic>> registerUser(
  //     String userName, String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/user/register'),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "longitude": "${userLocationCont.userLocation.value.longitude}",
  //       "latitude": "${userLocationCont.userLocation.value.latitude}"
  //     }, // Set the Content-Type header
  //     body: json.encode({
  //       "username": userName,
  //       "email": email,
  //       "password": password,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     print("Pas Daftar");
  //     print(response.statusCode);
  //     print(response.body);
  //     return Map<String, dynamic>.from(json.decode(response.body));
  //   } else {
  //     print("Pas gagal daftar");
  //     print(response.statusCode);
  //     print(response.body);
  //     throw Exception('Failed to register user');
  //   }
  // }

  // static Future<Map<String, dynamic>> verifyOtp(
  //     String email, String otp) async {
  //   final response = await http.post(Uri.parse('$baseUrl/user/otp-verify'),
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode({
  //         "email": email,
  //         "otp": otp,
  //       }));

  //   if (response.statusCode == 200) {
  //     print("pas verifikasi otp");
  //     print(response.statusCode);
  //     print(response.body);
  //     return Map<String, dynamic>.from(json.decode(response.body));
  //   } else {
  //     print("pas gagal verifikasi otp");
  //     print(response.statusCode);
  //     print(response.body);
  //     throw Exception('Failed to verify OTP');
  //   }
  // }
  Future<http.Response> verifyOtp(String email, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/otp-verify'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "email": email,
        "otp": otp,
      }),
    );

    return response;
  }

  Future<http.Response> resendOTP(String email) async {
    final response = await http.post(Uri.parse('$baseUrl/user/resend-otp'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "email": email,
        }));

    return response;
  }

  Future<http.Response> verifiedUser(VerifyUser user) async {
    final response = await http.post(Uri.parse('$baseUrl/user/register-data'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'email': user.email,
          'nik': user.nik,
          'fullname': user.fullName,
          'districtId': user.districtId,
          'address': user.address,
          'gender': user.gender,
          'placeBirth': user.placeBirth,
          'dateBirth': user.dateBirth,
          'work': user.work,
          'citizenship': user.citizenship
        }));

    return response;
  }
  // static Future<Map<String, dynamic>> resendOTP(String email) async {
  //   final response = await http.post(Uri.parse('$baseUrl/user/resend-otp'),
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode({
  //         "email": email,
  //       }));

  //   if (response.statusCode == 200) {
  //     print("resend otp");
  //     print(response.statusCode);
  //     print(response.body);
  //     return Map<String, dynamic>.from(json.decode(response.body));
  //   } else {
  //     print("pas gagal resend otp");
  //     print(response.statusCode);
  //     print(response.body);
  //     throw Exception('Failed to verify OTP');
  //   }
  // }

  Future<Map<String, dynamic>> resetPassword(
      String verifyId, String email, String newPassword) async {
    final response = await http.post(Uri.parse('$baseUrl/user/reset-password'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "verifyId": verifyId,
          "email": email,
          "newPassword": newPassword
        }));

    if (response.statusCode == 200) {
      print("reset password");
      print(response.statusCode);
      print(response.body);
      return Map<String, dynamic>.from(json.decode(response.body));
    } else {
      print("pas gagal resend otp");
      print(response.statusCode);
      print(response.body);
      throw Exception('gagal kirim otp');
    }
  }
}
