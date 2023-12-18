import 'package:capstone_wms/models/address_model.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var userAddress = AddressModel(
      country: '',
      province: '',
      provinceId: 0,
      regency: '',
      regencyId: 0,
      district: '',
      districtId: 0,
      fullAdress: '').obs;

  void updateUserAddress(AddressModel address) {
    userAddress.value = address;
  }
}
