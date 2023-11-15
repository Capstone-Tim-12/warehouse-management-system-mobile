import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/idverconf.dart';
import 'package:capstone_wms/screens/auth_screen/signin_screen.dart';
import 'package:flutter/material.dart';

class SignupConfirmation extends StatelessWidget {
  SignupConfirmation({super.key});

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
            'Skip',
            style: textApp.extraSmallInvLabel,
          ),
        ),
        automaticallyImplyLeading: false,
        // leading: const BackButton(),
      ),
      body: SizedBox(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    Text(
                      'account created successfully',
                      style: textApp.heading5,
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.check,
                      color: colorApp.secondaryColor,
                      size: 140,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Your password has been successfully changed, please click sign in to try your new password',
                        textAlign: TextAlign.center,
                        style: textApp.bodySmall,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorApp.mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          // Navigator.of(context).pushAndRemoveUntil(
                          //   MaterialPageRoute(
                          //     builder: (context) => const LoginScreen(),
                          //   ),
                          //   (route) => false,
                          // );

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const StartVerification()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 24),
                          child: Text(
                            'Next',
                            style: TextStyle(color: colorApp.light1),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
