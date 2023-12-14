  import 'dart:convert';
  import 'package:capstone_wms/classes/inputstyle_collection.dart';
  import 'package:capstone_wms/services/favorite_services.dart';
  import 'package:get/get.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  class FavoriteController extends GetxController {

    RxList<dynamic> favoriteList= <dynamic>[].obs;
    RxBool isLoading = false.obs;

    FavoriteService favoriteService = FavoriteService();

    Future<void> getWarehouseData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoading.value = true;
      favoriteList.clear();

      try {
        final response = await favoriteService.getFavorites(prefs.getString('token')!);
        Map<String, dynamic> responseData = json.decode(response.body);

        if (response.statusCode == 200) {
          if (responseData['data'] == null) {
            favoriteList.value = [];
          } else {
            List<dynamic> favoriteListResponse = responseData['data'];
            favoriteList.addAll(favoriteListResponse);
          }
        } else {
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> deleteFavorite(String id) async {
      isLoading.value = true;
      try {
        final response = await favoriteService.deleteFromFavorites(id);
        if (response.statusCode == 200) {
          await getWarehouseData();
          Get.snackbar(
            "Berhasil",
            "Berhasil dihapus dari favorit",
            backgroundColor: colorApp.light1,
          );
        } else {
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> addToFavorites(int warehouseId) async {
      try {
        final response = await favoriteService.addToFavorites(warehouseId);
        print(response.statusCode);
        print(warehouseId);
        if (response.statusCode == 201) {
          Get.snackbar(
            "Berhasil",
            "Berhasil ditambahkan ke favorit",
            backgroundColor: colorApp.light1,
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }