import 'package:capstone_wms/screens/profile/set_profile.dart';
import 'package:capstone_wms/screens/main/chatbot/chatscreen.dart';
import 'package:capstone_wms/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const ChatScreen(),
      //home: const SetProfileScreen(),
    );
  }
}
