import 'package:capstone_wms/models/signup_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var signUpUser = SignUp(username: '', email: '', password: '').obs;

  void updateSignUpUser(SignUp signup) {
    signUpUser.value = signup;
  }
}
