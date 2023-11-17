import 'package:capstone_wms/screens/profile/set_profile.dart';
import 'package:capstone_wms/screens/main/chatbot/chatscreen.dart';
import 'package:capstone_wms/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      home: const SetProfileScreen(),
    );
  }
}
