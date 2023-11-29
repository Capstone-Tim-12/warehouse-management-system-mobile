import 'package:capstone_wms/screens/main/profile/set_location.dart';
import 'package:capstone_wms/screens/main/profile/set_profile.dart';
import 'package:capstone_wms/screens/payment/payment_screen_main.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/screens/main/sewa/konfirmasi_sewa.dart';
import 'package:capstone_wms/screens/main/sewa/pengajuan_complete.dart';
import 'package:capstone_wms/screens/main/sewa/sewa_screen.dart';
import 'package:capstone_wms/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));

  // runApp(
  //   ProviderScope(
  //     child: MultiProvider(
  //       providers: [],
  //       child: const MyApp(),
  //     ),
  //   ),
  // );
}

ColorApp colorApp = ColorApp();
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DigiHouse Mobile',
      // navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorApp.mainColorDarker),
        useMaterial3: true,
      ),

      home: const SetProfileScreen(),
      // home: const SplashScreen(),
    );
  }
}
