import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_forgotpw.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_inputotp.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_login.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_newpassword.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_otpemail.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_registconfirm.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_resetpwconfirm.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_signup.dart';
import 'package:capstone_wms/screens/auth_screen/signin_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();
  // List<Widget> listAuthScreen = [
  //   const BottomSheetLogin(),
  //   const BottomSheetForgotPw()
  // ];
  // int authIndex = 0;

  // void showBottomSheetLogin(BuildContext context){

  // }

  @override
  void initState() {
    BuildContext kontextScreen = context;
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      // Navigate to the login screen
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //   builder: (context) => const LoginScreen(),
      // ));
      print(context);

      showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (context) => BottomSheetLogin(
          //===================
          //buat daftar
          //===================

          onSignUpPressed: () {
            // Navigator.pop(context);
            showModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              isScrollControlled: true,
              context: kontextScreen,
              builder: (context) => BottomSheetSignUp(
                onRegisterPressed: () {
                  // Navigator.popUntil(context, (route) => false);
                  // Navigator.pop(context);
                  showModalBottomSheet(
                    isDismissible: false,
                    enableDrag: false,
                    isScrollControlled: true,
                    context: kontextScreen,
                    builder: (context) =>
                        BotomSheetOTPEmail(onEmailOTPPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        isDismissible: false,
                        enableDrag: false,
                        isScrollControlled: true,
                        context: kontextScreen,
                        builder: (context) => const KonfirmasiRegister(),
                      );
                    }),
                  );
                },
              ),
            );
          },

          //===================
          //buat reset pw
          //===================
          onForgotPasswordPressed: () {
            Navigator.pop(context);
            showModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              context: context,
              isScrollControlled: true,
              builder: (context) => BottomSheetForgotPw(
                onSendOTPPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    isDismissible: false,
                    enableDrag: false,
                    isScrollControlled: true,
                    context: kontextScreen,
                    builder: (context) => BottomSheetOTP(
                      onOTPNextPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          isDismissible: false,
                          enableDrag: false,
                          isScrollControlled: true,
                          context: kontextScreen,
                          builder: (context) => BottomSheetNewPW(
                            onPWConfirmedPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: false,
                                  isScrollControlled: true,
                                  context: kontextScreen,
                                  builder: (context) =>
                                      const KonfirmasiResetPW());
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        const AuthBg(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.warehouse,
              //   size: 99,
              //   color: Colors.white,
              // ),
              Image.asset('assets/image/logowms.png'),
              Text('DigiHouse', style: textApp.heading2),
            ],
          ),
        ),
      ]),

      // bottomSheet: Container(
      //   child: const BottomSheetLogin(),
      // ),
    );
  }
}
