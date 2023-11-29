import 'package:camera/camera.dart';
import 'package:get/get.dart';

class KTPController extends GetxController {
  // RxString ktpFilePath = ''.obs;
  // RxString selfieKTPPath = ''.obs;
  Rx<XFile?> ktpFile = Rx<XFile?>(null);
  Rx<XFile?> selfieKTPFile = Rx<XFile?>(null);

  // void setKtpFilePath(String filePath) {
  //   ktpFilePath.value = filePath;
  // }

  // void setSelfieKtpFilePath(String filepath) {
  //   selfieKTPPath.value = filepath;
  // }

  void setKtpFile(XFile? file) async {
    ktpFile.value = file;
  }

  void setSelfieKtpFile(XFile? file) async {
    selfieKTPFile.value = file;
  }
}
