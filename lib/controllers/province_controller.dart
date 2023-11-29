import 'package:capstone_wms/models/locationapi_model.dart';
import 'package:get/get.dart';

class ProvinceController extends GetxController {
  List<LocationCollectionModel> provinceList = <LocationCollectionModel>[].obs;

  // List<SelectedListItem> regencyList = [].obs as List<SelectedListItem>;

  void setProvinceList(List<LocationCollectionModel> cities) {
    provinceList = cities;
    // print(regencyList.toList());
    // print([...regencyList]);
  }

  List<LocationCollectionModel> parseProvinceList(Map<String, dynamic> json) {
    List<LocationCollectionModel> provincies = [];

    if (json.containsKey('data')) {
      provincies = List<LocationCollectionModel>.from(json['data'].map((city) {
        return LocationCollectionModel(
            id: city['id'].toString(), name: city['name']);
      }));
    }

    return provincies;
  }
}
