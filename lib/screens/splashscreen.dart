import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/auth_bg.dart';
import 'package:capstone_wms/controllers/userlocation_controller.dart';
import 'package:capstone_wms/models/user_model.dart';
import 'package:capstone_wms/models/userlocation_model.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_forgotpw.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_inputotp.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_login.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_newpassword.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_otpemail.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_registconfirm.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_resetpwconfirm.dart';
import 'package:capstone_wms/screens/auth_screen/components/bs_signup.dart';
import 'package:capstone_wms/screens/auth_screen/signin_screen.dart';
import 'package:capstone_wms/screens/main/dashboard/dashboard.dart';
import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:capstone_wms/services/firebase_services.dart';
import 'package:capstone_wms/services/location_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();

  LocationService _locationService = LocationService();
  final UserLocationController userLocationController =
      Get.put(UserLocationController());

  FirebaseServices checkUserLoggedIn = FirebaseServices();

  Future<void> initializeUserLoc(BuildContext konteks) async {
    try {
      await _locationService.getLocationPermission();
      await _locationService.getCurrentLocation();
      // LocationService userLocation = await getCurrentLocation();
      // userLocationController.setUserLocation(userLocation);
    } catch (e) {
      print(e);
    }
  }

  // Future<bool> checkUserExists(int userId) async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
  //       .instance
  //       .collection('users')
  //       .where('userId', isEqualTo: userId)
  //       .get();

  //   return snapshot.docs.isNotEmpty;
  // }

  void initializeData(BuildContext kontextScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 3), () async {
      print(DateTime.now());
      if (prefs.containsKey('userId') ||
          prefs.containsKey('name') ||
          prefs.containsKey('token') ||
          prefs.containsKey('userDoc') ||
          prefs.containsKey('email')) {
        int userId = prefs.getInt('userId')!;
        bool userExists = await checkUserLoggedIn.checkUserExists(userId);

        if (userExists) {
          Get.offAll(const MainScreen(), transition: Transition.leftToRight);
          print('userExists');
          print(prefs.getString('userDoc'));
        } else {
          UserModel oldUser = UserModel(
              id: '',
              userId: userId,
              name: prefs.getString('name')!,
              picKTP: '',
              selKTP: '');
          await checkUserLoggedIn.addUser(oldUser);
          print('oldUserAdded');
          Get.offAll(const MainScreen(), transition: Transition.leftToRight);
        }
      } else {
        print(context);

        showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          barrierColor: Colors.transparent,
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
                barrierColor: Colors.transparent,
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
                barrierColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (context) => BottomSheetForgotPw(
                  onSendOTPPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      isDismissible: false,
                      enableDrag: false,
                      barrierColor: Colors.transparent,
                      isScrollControlled: true,
                      context: kontextScreen,
                      builder: (context) => BottomSheetOTP(
                        onOTPNextPressed: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            isDismissible: false,
                            enableDrag: false,
                            barrierColor: Colors.transparent,
                            isScrollControlled: true,
                            context: kontextScreen,
                            builder: (context) => BottomSheetNewPW(
                              onPWConfirmedPressed: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                    isDismissible: false,
                                    enableDrag: false,
                                    barrierColor: Colors.transparent,
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
      }
    });
  }

  @override
  void initState() {
    BuildContext kontextScreen = context;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    super.initState();
    initializeData(kontextScreen);
    initializeUserLoc(kontextScreen);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
      ),
    );
  }
}
