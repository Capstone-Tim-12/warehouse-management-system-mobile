import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:flutter/material.dart';

ColorApp colorApp = ColorApp();

class DecorationCollection {
  InputDecoration emailField = const InputDecoration(
      hintText: 'JaneDoe@mail.com',
      labelText: 'Email',
      suffixIcon: Icon(Icons.email));

  InputDecoration userNameField = const InputDecoration(
      hintText: 'JaneDoe@mail.com',
      labelText: 'Username',
      suffixIcon: Icon(Icons.person));

  // InputDecoration passwordField = const InputDecoration(
  //   labelText: 'Password',
  //   hintText: 'Enter Your Password',
  // );

  InputDecoration otpField = InputDecoration(
      filled: true,
      fillColor: colorApp.light1,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Color(0xFF5C5C5C))));
}
