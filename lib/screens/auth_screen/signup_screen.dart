import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/screens/auth_screen/signupver_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordcCont = TextEditingController();
  TextEditingController repeatPasswordcCont = TextEditingController();
  bool isPasswordVisible = false;
  bool isRePasswordVisible = false;

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPasswordVisible = true;
    isRePasswordVisible = true;
  }

  void showPw() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void showRePw() {
    setState(() {
      isRePasswordVisible = !isRePasswordVisible;
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
            'Sign Up',
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
              SingleChildScrollView(
                child: Padding(
                  // padding: paddingApp.signInPadding,
                  padding: const EdgeInsets.only(
                      top: 180, left: 27, right: 22, bottom: 127),
                  child: Container(
                    width: screenWidth * 0.9,
                    // height: 527,
                    decoration: BoxDecoration(
                        color: colorApp.blugrey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: paddingApp.textFieldPadding,
                          child: TextField(
                            controller: usernameCont,
                            decoration: fieldStyle.userNameField,
                          ),
                        ),
                        Padding(
                          padding: paddingApp.textFieldPadding,
                          child: TextField(
                            controller: emailCont,
                            decoration: fieldStyle.emailField,
                          ),
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
                        Padding(
                          padding: paddingApp.textFieldPadding,
                          child: TextField(
                            controller: repeatPasswordcCont,
                            obscureText: isRePasswordVisible,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                hintText: 'Repeat Your Password',
                                suffixIcon: IconButton(
                                  onPressed: showRePw,
                                  icon: Icon(isRePasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorApp.mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpVerificcation(
                                      email: 'static@mail.com')));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 24),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: colorApp.light1),
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              ' or sign up with ',
                              style: textApp.largeLabelBlack,
                            ),
                            Container(
                              width: 56,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width: 45,
                                height: 45,
                                child: Padding(
                                  padding: paddingApp.iconPadding,
                                  child:
                                      SvgPicture.asset('assets/svg/g_logo.svg'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width: 45,
                                height: 45,
                                child: Padding(
                                  padding: paddingApp.iconPadding,
                                  child: SvgPicture.asset(
                                      'assets/svg/fb_logo.svg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'already have an account?',
                              style: textApp.smallLabelBlackclear,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop;
                              },
                              child: Text(
                                'Sign In',
                                style: textApp.normalLabel,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
