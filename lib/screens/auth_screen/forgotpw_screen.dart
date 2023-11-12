import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/screens/auth_screen/resetpw_screen.dart';
import 'package:flutter/material.dart';

class ForgotPw extends StatefulWidget {
  const ForgotPw({super.key});

  @override
  State<ForgotPw> createState() => _ForgotPwState();
}

class _ForgotPwState extends State<ForgotPw> {
  TextEditingController emailCont = TextEditingController();

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
            'Forgot Password',
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
                        height: 10,
                      ),
                      Text(
                        'No worries we\'ll send you reset intructions',
                        style: textApp.bodyNormalLight,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: paddingApp.textFieldPadding,
                        child: TextField(
                          controller: emailCont,
                          decoration: fieldStyle.emailField,
                        ),
                      ),

                      // const SizedBox(
                      //   height: 28,
                      // ),
                      const SizedBox(
                        height: 150,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorApp.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResetPassword(
                                      email: 'static@mail.com',
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: Text(
                              'Reset Password',
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
