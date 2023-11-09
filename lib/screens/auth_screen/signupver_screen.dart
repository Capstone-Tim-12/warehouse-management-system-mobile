import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/screens/auth_screen/signupconf_screen.dart';
import 'package:flutter/material.dart';

class SignUpVerificcation extends StatefulWidget {
  SignUpVerificcation({super.key, required this.email});

  String email = '';

  @override
  State<SignUpVerificcation> createState() => _SignUpVerificcationState();
}

class _SignUpVerificcationState extends State<SignUpVerificcation> {
  TextEditingController otpCont1 = TextEditingController();
  TextEditingController otpCont2 = TextEditingController();
  TextEditingController otpCont3 = TextEditingController();
  TextEditingController otpCont4 = TextEditingController();

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  Widget build(BuildContext context) {
    final sizeCollection = SizeCollection(context);

    double screenWidth = sizeCollection.screenWidth;
    double screenHeight = sizeCollection.screenHeight;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Verification',
            style: textApp.heading4White,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              const AuthBg(),
              Padding(
                // padding: paddingApp.signInPadding,
                padding: const EdgeInsets.only(
                    top: 180, left: 27, right: 22, bottom: 127),
                child: Container(
                  width: screenWidth * 0.9,
                  height: 382,
                  decoration: BoxDecoration(
                      color: colorApp.blugrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 56,
                      ),
                      Text(
                        'we sent a code to ${widget.email}',
                        style: textApp.bodyNormalLight,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: paddingApp.textFieldPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 65,
                              child: TextField(
                                controller: otpCont1,
                                textAlign: TextAlign.center,
                                decoration: fieldStyle.otpField,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 80,
                              width: 65,
                              child: TextField(
                                controller: otpCont2,
                                textAlign: TextAlign.center,
                                decoration: fieldStyle.otpField,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 80,
                              width: 65,
                              child: TextField(
                                controller: otpCont3,
                                textAlign: TextAlign.center,
                                decoration: fieldStyle.otpField,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 80,
                              width: 65,
                              child: TextField(
                                controller: otpCont4,
                                textAlign: TextAlign.center,
                                decoration: fieldStyle.otpField,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn’t receive the email?',
                            style: textApp.bodyNormalLight,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Click to resend',
                            style: textApp.smallLabel,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      // const SizedBox(
                      //   height: 28,
                      // ),
                      const SizedBox(
                        height: 104,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorApp.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupConfirmation()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: Text(
                              'Continue',
                              style: TextStyle(color: colorApp.light1),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
