import 'dart:convert';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:capstone_wms/controllers/address_controller.dart';
import 'package:capstone_wms/controllers/identity_controller.dart';
import 'package:capstone_wms/controllers/ktp_controller.dart';
import 'package:capstone_wms/models/user_model.dart';
import 'package:capstone_wms/models/verifiyuser_model.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/checkid_screen.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/verification_success.dart';
import 'package:capstone_wms/services/authentication.dart';
import 'package:capstone_wms/services/firebase_services.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelfieKTP extends StatefulWidget {
  const SelfieKTP({super.key});

  @override
  State<SelfieKTP> createState() => _SelfieKTPState();
}

class _SelfieKTPState extends State<SelfieKTP> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  late CameraController? _cameraController;
  String recognizedText = '';
  bool _isCameraInitialized = false;
  bool _isLoading = false;
  bool picTaken = false;
  bool isKTPUploading = false;
  bool isSelfUploading = false;
  bool isUpdating = false;
  String KTPpicUrl = '';
  String selfieKtpPicUrl = '';

  // final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  KTPController getSelfieKTPPath = Get.put(KTPController());
  IdentityController getUserIdentity = Get.put(IdentityController());
  AddressController getUserAddress = Get.put(AddressController());
  FirebaseServices firebase = FirebaseServices();
  AuthService authService = AuthService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController?.dispose();
  }

  // void verifiyingUser() async {
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await takePic();

  //     if (picTaken) {
  //       await upKTPPicToStorage();
  //       if (isKTPUploading) {
  //         await upSelfPicToStorage();
  //         if (isSelfUploading) {
  //           await updateUser();
  //           if (isUpdating) {
  //             await verifyUser();
  //           }
  //         }
  //       }
  //       // if (isUploading) {
  //       //   await updateUser();
  //       //   if (isUpdating) {
  //       //     await verifyUser();
  //       //   }
  //       // }
  //     }
  //   } catch (e) {
  //     Get.snackbar("Peringatan", "Terjadi kesalahan",
  //         backgroundColor: colorApp.light1);
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  void verifiyingUser() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await verifyUser();
    } catch (e) {
      Get.snackbar("Peringatan", "Terjadi kesalahan",
          backgroundColor: colorApp.light1);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> takePic() async {
    try {
      await _cameraController!.setFlashMode(FlashMode.off);

      XFile image = await _cameraController!.takePicture();
      print(image.path);

      getSelfieKTPPath.setSelfieKtpFile(image);
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        picTaken = true;
      });
    }
  }

  Future<void> upKTPPicToStorage() async {
    try {
      String? ktpUrl = await firebase
          .uploadKTPToFirebaseStorage(getSelfieKTPPath.ktpFile.value!);

      // String? selfieKtp = await firebase.uploadSelfieKTPToFirebaseStorage(
      //     getSelfieKTPPath.selfieKTPFile.value!);

      setState(() {
        KTPpicUrl = ktpUrl!;
        // selfieKtpPicUrl = selfieKtp!;
        // isUploading = true;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isKTPUploading = true;
      });
    }
    // await firebase.uploadKTPToFirebaseStorage(getSelfieKTPPath.selfieKTPFile.value!);
  }

  Future<void> upSelfPicToStorage() async {
    try {
      // String? ktpUrl = await firebase
      //     .uploadKTPToFirebaseStorage(getSelfieKTPPath.ktpFile.value!);

      String? selfieKtp = await firebase.uploadSelfieKTPToFirebaseStorage(
          getSelfieKTPPath.selfieKTPFile.value!);

      setState(() {
        // KTPpicUrl = ktpUrl!;
        selfieKtpPicUrl = selfieKtp!;
        // isUploading = true;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isSelfUploading = true;
      });
    }
    // await firebase.uploadKTPToFirebaseStorage(getSelfieKTPPath.selfieKTPFile.value!);
  }

  Future<void> updateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? docId = prefs.getString('userDoc');
    int? uid = prefs.getInt('userId');
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');

    try {
      UserModel updateUser = UserModel(
          id: docId!,
          email: email,
          userId: uid!,
          name: name!,
          picKTP: KTPpicUrl,
          selKTP: selfieKtpPicUrl);

      await firebase.verifyUser(updateUser);
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isUpdating = true;
      });
    }
  }

  Future<void> verifyUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> splitDate =
        getUserIdentity.userIdentity.value.birthDate.toString().split(' ');

    String date = splitDate[0];
    print(date);

    String? email = prefs.getString('email');
    VerifyUser userData = VerifyUser(
        email: email!,
        nik: getUserIdentity.userIdentity.value.nik,
        fullName: getUserIdentity.userIdentity.value.fullName,
        districtId: getUserAddress.userAddress.value.districtId.toString(),
        address: getUserAddress.userAddress.value.fullAdress,
        gender: getUserIdentity.userIdentity.value.genderId!,
        placeBirth: getUserIdentity.userIdentity.value.birthPlace,
        dateBirth: "${date}T00:00:00.000+07:00",
        work: getUserIdentity.userIdentity.value.job,
        citizenship: getUserIdentity.userIdentity.value.citizenship);

    try {
      final response = await authService.verifiedUser(userData);

      final reponseData = json.decode(response.body);

      if (response.statusCode == 201) {
        Get.off(() => VerificationSuccess());
        print(reponseData["message"]);
        print(reponseData);
      } else {
        Get.snackbar(response.statusCode.toString(), reponseData["message"]);
        print(reponseData["message"]);
      }
    } catch (e) {
      Get.snackbar("Peringatan", "Terjadi Kesalahan",
          backgroundColor: colorApp.light1);
    } finally {
      _isLoading = false;
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      // Handle case where no cameras are available
      return;
    }

    final camera = cameras[1];

    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      // Handle camera initialization error
      print('Error initializing camera: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void printText() {
    print(recognizedText);
  }

  @override
  Widget build(BuildContext context) {
    SizeCollection sizeCollection = SizeCollection(context);
    double width = sizeCollection.screenWidth;

    if (!_isCameraInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
        backgroundColor: colorApp.bgAuthScaffold,
        appBar: AppBar(
          backgroundColor: colorApp.bgAuthScaffold,
          title: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  color: colorApp.stateSuccess,
                  shape: const OvalBorder(),
                ),
                child: Icon(
                  Icons.check,
                  color: colorApp.light1,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 12,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  color: colorApp.stateSuccess,
                  shape: const OvalBorder(),
                ),
                child: Icon(
                  Icons.check,
                  color: colorApp.light1,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              // const SizedBox(
              //   width: 2,
              // ),
              Container(
                // width: double.infinity,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: const ShapeDecoration(
                  color: Color(0xFF0063F7),
                  shape: OvalBorder(),
                ),
                child: const Center(
                    child: Text(
                  '3',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
              ),
              Text(
                'Selfie KTP',
                style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(
                child:
                    CircularProgressIndicator(color: colorApp.mainColorDarker),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ambil Foto KTP',
                      style: textApp.heading3,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // ),

                    Container(
                      width: double.infinity,
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ScalableOCR(
                            // paintboxCustom: Paint()
                            //   ..style = PaintingStyle.stroke
                            //   ..strokeWidth = 4.0
                            //   ..color = colorApp.secondaryColor,
                            boxLeftOff: 11,
                            boxBottomOff: 4.7,
                            boxRightOff: 11,
                            // boxRightOff: 6,
                            boxTopOff: 9,
                            boxHeight: 264,
                            getScannedText: (value) {
                              setState(() {
                                recognizedText = value;
                              });
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          left: 0,
                          // right: width * 0.27,
                          // left: width * 0.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorApp.secondaryColor,
                                  shape: const CircleBorder()),
                              onPressed: !_isLoading
                                  ? () {
                                      // takePic();
                                      verifiyingUser();
                                    }
                                  : null,
                              child: SizedBox(
                                height: 70,
                                width: 79,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: colorApp.mainColor,
                                ),
                              )),
                        )
                      ]),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    const Align(
                        alignment: Alignment.center,
                        child:
                            Text('Tempatkan KTP di dalam area yang tersedia'))
                  ],
                ),
              ));
  }
}
