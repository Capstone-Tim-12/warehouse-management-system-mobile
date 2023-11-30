import 'package:capstone_wms/screens/main/dashboard/search_screen.dart';
import 'package:get/get.dart';

class FindController extends GetxController {
  RxString searchString = ''.obs;

  void onSearchSubmitted(String query) {
    searchString.value = query;
    Get.to(const SearchScreen());
  }

  void onSearchChanged(String query) {
    searchString.value = query;
  }
}
