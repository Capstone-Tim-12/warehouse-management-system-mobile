import 'package:capstone_wms/models/identity_model.dart';
import 'package:get/get.dart';

class IdentityController extends GetxController {
  var userIdentity = IdentityModel(
          nik: '',
          fullName: '',
          gender: '',
          genderId: '',
          birthPlace: '',
          birthDate: DateTime.now(),
          job: '',
          citizenship: '')
      .obs;

  RxString birthDateString = ""
      // "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"
      .obs;
  RxString postBirthDateString = ""
      // "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"
      .obs;

  void updateUserIdentity(IdentityModel user) {
    userIdentity.value = user;

    birthDateString.value =
        "${userIdentity.value.birthDate.year}-${userIdentity.value.birthDate.month}-${userIdentity.value.birthDate.day}";
    postBirthDateString.value =
        "${userIdentity.value.birthDate.year}-${userIdentity.value.birthDate.month}-${userIdentity.value.birthDate.day}T12:34:56.789012345Z";
  }
}
