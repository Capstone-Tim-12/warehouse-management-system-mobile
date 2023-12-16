import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:http/http.dart' as http;

class AvatarService {
  // static const String baseUrl =
  //   "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> getAvatar(String token) async {
    final response =
        await http.get(Uri.parse('$baseUrl/user/avatar'), headers: {
      'Authorization': 'Bearer $token',
    });
    return response;
  }
}
