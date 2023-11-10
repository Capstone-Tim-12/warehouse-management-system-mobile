import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/screens/main/stack_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordcCont = TextEditingController();

  ColorApp colorApp = ColorApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                // color: colorApp.,
                ),
            child: Column(
              children: [
                TextField(
                  controller: emailCont,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordcCont,
                ),
                const SizedBox(
                  height: 28,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                    },
                    child: const Text('Sign In'))
              ],
            ),
          ),
        ));
  }
}
