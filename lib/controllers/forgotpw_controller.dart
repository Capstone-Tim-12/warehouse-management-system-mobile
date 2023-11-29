import 'package:capstone_wms/models/forgotpw_model.dart';
import 'package:capstone_wms/screens/auth_screen/setnewpw_screen.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  // var forgotPw =
  //     ForgotPasswordModel(verifyId: '', email: '', newPassword: '').obs;
  RxString verifyId = ''.obs;
  RxString email = ''.obs;
  RxString newPassword = ''.obs;

  // void updateForgotPassword(ForgotPasswordModel forgotpw) {
  //   forgotPw.value = forgotpw;
  // }

  void setEmail(String emailUser) {
    email.value = emailUser;
  }
  void setVerifyID(String verifyid) {
    verifyId.value = verifyid;
  }
  void setNewPassword(String newPw) {
    newPassword.value = newPw;
  }
}
