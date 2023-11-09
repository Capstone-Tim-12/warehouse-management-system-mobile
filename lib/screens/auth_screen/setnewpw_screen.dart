import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/screens/auth_screen/resetpwconf.dart';
import 'package:flutter/material.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  TextEditingController passwordcCont = TextEditingController();
  TextEditingController rePasswordcCont = TextEditingController();
  bool isPasswordVisible = false;

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPasswordVisible = true;
  }

  void showPw() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

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
            'Set New Password',
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
                        'must be at least 8 characters',
                        style: textApp.bodyNormalLight,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: paddingApp.textFieldPadding,
                        child: TextField(
                          controller: passwordcCont,
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Your Password',
                              suffixIcon: IconButton(
                                onPressed: showPw,
                                icon: Icon(isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: paddingApp.textFieldPadding,
                        child: TextField(
                          controller: rePasswordcCont,
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                              labelText: 'Repeat Password',
                              hintText: 'Enter Your Password',
                              suffixIcon: IconButton(
                                onPressed: showPw,
                                icon: Icon(isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorApp.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResetConfirmation()));
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
