import 'dart:math';

import 'package:camera/camera.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/checkid_screen.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/verification_success.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

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
  bool _isScanning = false;

  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController?.dispose();
  }

  Future<void> takePic() async {
    try {
      await _cameraController!.setFlashMode(FlashMode.off);

      XFile image = await _cameraController!.takePicture();
      print(image.path);

      _cameraController!.dispose();

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerificationSuccess()));
    } catch (e) {
      print(e);
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

    // if (!_cameraController.value.isInitialized) {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
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
        body: Padding(
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

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child: SizedBox(
              //     height: 264,
              //     width: double.infinity, // Adjust the height as needed
              //     child: !_cameraController.value.isInitialized
              //         ? const CircularProgressIndicator()
              //         : CameraPreview(_cameraController),
              //   ),
              // ),

              Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                // height: 300,

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
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(20),
                  //   child: Container(
                  //       height: 800,
                  //       width: double.infinity,
                  //       child: _cameraController != null &&
                  //               _cameraController!.value.isInitialized
                  //           ? CameraPreview(_cameraController!)
                  //           : const SizedBox() // Placeholder or other UI when not initialized
                  //       ),
                  // ),
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
                        onPressed: () {
                          // _startOcr();
                          // _startGoogleOcr();
                          // printText();
                          takePic();
                        },
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
                  child: Text('Tempatkan KTP di dalam area yang tersedia'))
            ],
          ),
        ));
  }
}
