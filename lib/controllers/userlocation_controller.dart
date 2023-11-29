import 'package:capstone_wms/models/userlocation_model.dart';
import 'package:get/get.dart';

class UserLocationController extends GetxController {
  var userLocation = UserLocation(longitude: 0, latitude: 0).obs;

  void saveUserLocation(UserLocation userLocation) {
    this.userLocation.value = userLocation;
  }
}
