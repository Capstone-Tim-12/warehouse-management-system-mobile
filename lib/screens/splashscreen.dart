import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the login screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warehouse,
              size: 99,
              color: Colors.white,
            ),
            Text('DigiHouse', style: textApp.heading2),
          ],
        ),
      ),
    );
  }
}
