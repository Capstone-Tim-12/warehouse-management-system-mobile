import 'package:capstone_wms/models/locationapi_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:get/get.dart';

class RegencyController extends GetxController {
  List<LocationCollectionModel> regencyList = <LocationCollectionModel>[].obs;

  // List<SelectedListItem> regencyList = [].obs as List<SelectedListItem>;

  void setRegencyList(List<LocationCollectionModel> cities) {
    regencyList = cities;
    // print(regencyList.toList());
    // print([...regencyList]);
  }

  List<LocationCollectionModel> parseCityList(Map<String, dynamic> json) {
    List<LocationCollectionModel> regencies = [];

    if (json.containsKey('data')) {
      regencies = List<LocationCollectionModel>.from(json['data'].map((city) {
        return LocationCollectionModel(id: city['id'].toString(), name: city['name']);
      }));
    }

    return regencies;
  }
}
