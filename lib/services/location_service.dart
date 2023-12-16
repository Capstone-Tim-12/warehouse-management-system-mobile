import 'package:capstone_wms/classes/constants/urls_collection.dart';
import 'package:capstone_wms/controllers/userlocation_controller.dart';
import 'package:capstone_wms/models/userlocation_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocationService {
  UserLocationController saveUserLoc = Get.put(UserLocationController());
  // static const String baseUrl =
  //     "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  String baseUrl = UrlCollection().urlProd;

  Future<http.Response> getRegencyList(String selectedProvince) async {
    final response = await http.get(Uri.parse("$baseUrl/user/regency/$selectedProvince"));
    return response;
  }

   Future<http.Response> getProvinceList() async {
    final response = await http.get(Uri.parse("$baseUrl/user/province"));
    return response;
  }

   Future<http.Response> getDistrictList(String selectedRegency) async {
    final response = await http.get(Uri.parse("$baseUrl/user/district/$selectedRegency"));
    return response;
  }

  Future<void> getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Geolocator.requestPermission();
      }
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double latitude = position.latitude;
      double longitude = position.longitude;

      saveUserLoc.saveUserLocation(
          UserLocation(latitude: latitude, longitude: longitude));

      print("Latitude: $latitude, Longitude: $longitude");
    } catch (e) {
      print("Error getting location: $e");
    }
  }
}
