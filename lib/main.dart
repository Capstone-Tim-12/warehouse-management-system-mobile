import 'package:capstone_wms/screens/payment/payment_screen_main.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/screens/profile/set_profile.dart';
import 'package:capstone_wms/screens/main/chatbot/chatscreen.dart';
import 'package:capstone_wms/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

ColorApp colorApp = ColorApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorApp.mainColorDarker),
        useMaterial3: true,
      ),

      home: const SplashScreen(),
    );
  }
}
