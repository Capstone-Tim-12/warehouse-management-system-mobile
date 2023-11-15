import 'dart:math';

import 'package:camera/camera.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/checkid_screen.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class KtpScanner extends StatefulWidget {
  const KtpScanner({super.key});

  @override
  State<KtpScanner> createState() => _KtpScannerState();
}

class _KtpScannerState extends State<KtpScanner> {
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

  Future<void> _startOcr() async {
    setState(() {
      _isScanning = true;
    });
    try {
      await _cameraController!.setFlashMode(FlashMode.off);

      XFile image = await _cameraController!.takePicture();
      // final result =
      //     await FlutterTesseractOcr.extractTextFromImage(imagePath: image.path);
      final result =
          await FlutterTesseractOcr.extractText(image.path, language: 'eng');

      setState(() {
        recognizedText = result;
        _isScanning = false;
      });

      print(recognizedText);

      // Navigate to the next screen after OCR
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ResultScreen(recognizedText: recognizedText),
      //   ),
      // );
    } catch (e) {
      print("Error during OCR: $e");
    } finally {
      // await _cameraController!.setFlashMode(FlashMode.auto);
    }
  }

  Future<void> takePic() async {
    try {
      await _cameraController!.setFlashMode(FlashMode.off);

      XFile image = await _cameraController!.takePicture();
      print(image.path);

      _cameraController!.dispose();

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const CheckIdentity()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _startGoogleOcr() async {
    setState(() {
      _isScanning = true;
    });
    try {
      await _cameraController!.setFlashMode(FlashMode.off);

      XFile image = await _cameraController!.takePicture();

      final inputImage = InputImage.fromFilePath(image.path);

      RecognizedText result = await textRecognizer.processImage(inputImage);
      // await textRecognizer.close();
      // recognizedText = result.text;
      recognizedText = '';

      // for (TextBlock block in result.blocks) {
      //   final Rect rect = block.boundingBox;
      //   final List<Point<int>> cornerPoints = block.cornerPoints;
      //   final String text = block.text;
      //   final List<String> languages = block.recognizedLanguages;

      //   for (TextLine line in block.lines) {
      //     // Same getters as TextBlock
      //     for (TextElement element in line.elements) {
      //       // Same getters as TextBlock
      //     }
      //   }
      // }

      for (TextBlock block in result.blocks) {
        for (TextLine line in block.lines) {
          recognizedText = "$recognizedText${line.text}\n";
        }
      }
      print(recognizedText);
      _isScanning = false;
      setState(() {});
    } catch (e) {
      print("Error during OCR: $e");
    }

    // setState(() {
    //   recognizedText = result.text;
    //   _isScanning = false;
    // });

    // Navigate to the next screen after OCR
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ResultScreen(recognizedText: recognizedText),
    //   ),
    // );
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      // Handle case where no cameras are available
      return;
    }

    final camera = cameras.first;

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
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: const ShapeDecoration(
                  color: Color(0xFF0063F7),
                  shape: OvalBorder(),
                ),
                child: const Center(
                    child: Text(
                  '1',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Foto KTP',
                style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 120,
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
                decoration: ShapeDecoration(
                  color: colorApp.light1,
                  shape: const OvalBorder(),
                ),
                child: const Center(
                    child: Text(
                  '2',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  color: colorApp.light1,
                  shape: const OvalBorder(),
                ),
                child: const Center(
                    child: Text(
                  '3',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
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
                      paintboxCustom: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4.0
                        ..color = colorApp.secondaryColor,
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
