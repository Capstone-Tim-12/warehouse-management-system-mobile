import 'package:capstone_wms/models/locationapi_model.dart';
import 'package:get/get.dart';

class DistrictController extends GetxController {
  List<LocationCollectionModel> districtList = <LocationCollectionModel>[].obs;

  // List<SelectedListItem> regencyList = [].obs as List<SelectedListItem>;

  void setDistrictList(List<LocationCollectionModel> cities) {
    districtList = cities;
    // print(regencyList.toList());
    // print([...regencyList]);
  }

  List<LocationCollectionModel> parseDistrictList(Map<String, dynamic> json) {
    List<LocationCollectionModel> districts = [];

    if (json.containsKey('data')) {
      districts = List<LocationCollectionModel>.from(json['data'].map((city) {
        return LocationCollectionModel(
            id: city['id'].toString(), name: city['name']);
      }));
    }

    return districts;
  }
}