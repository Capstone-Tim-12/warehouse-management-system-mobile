import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:flutter/material.dart';

ColorApp colorApp = ColorApp();

class DecorationCollection {
  InputDecoration emailField = const InputDecoration(
    hintText: 'JaneDoe@mail.com',
    labelText: 'Email',
    filled: true,
    fillColor: Color(0xFFf8f4fc),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none, // Set borderSide to BorderSide.none
    ),
    prefixIcon: Icon(Icons.email),
  );

  InputDecoration userNameField = const InputDecoration(
    hintText: 'Jane Doe',
    labelText: 'Nama',
    filled: true,
    fillColor: Color(0xFFf8f4fc),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none, // Set borderSide to BorderSide.none
    ),
    prefixIcon: Icon(Icons.person),
  );

  InputDecoration nikField = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Color(0xFFC7C9D9))));

  InputDecoration otpField = InputDecoration(
      filled: true,
      fillColor: colorApp.light1,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Color(0xFF5C5C5C))));

  //Dropdown btn styles

  ButtonStyle dropdownGender = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(width: 1, color: Color(0xFFC7C9D9)),
    ),
  );
}
