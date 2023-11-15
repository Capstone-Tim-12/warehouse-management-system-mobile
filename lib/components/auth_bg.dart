import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthBg extends StatelessWidget {
  const AuthBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SvgPicture.asset(
        'assets/svg/register.svg',
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
