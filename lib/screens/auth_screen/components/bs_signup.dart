import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetSignUp extends StatefulWidget {
  const BottomSheetSignUp({super.key, required this.onRegisterPressed});

  final VoidCallback onRegisterPressed;

  @override
  State<BottomSheetSignUp> createState() => _BottomSheetSignUpState();
}

class _BottomSheetSignUpState extends State<BottomSheetSignUp> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordcCont = TextEditingController();
  TextEditingController rePasswordcCont = TextEditingController();
  bool isPasswordVisible = false;
  bool isRePasswordVisible = false;

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPasswordVisible = true;
    isRePasswordVisible = true;
  }

  void showPw() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void showRePw() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.0561,
              vertical: 32),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar',
                  style: textApp.heading4,
                ),
                Text(
                  'Halo, silahkan register untuk melanjutkan!',
                  style: textApp.bodySmall
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                ),
                const SizedBox(
                  height: 28,
                ),
                TextField(
                  controller: nameCont,
                  decoration: fieldStyle.userNameField,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailCont,
                  decoration: fieldStyle.emailField,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordcCont,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    suffixIcon: IconButton(
                      onPressed: showPw,
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFf8f4fc),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide.none, // Set borderSide to BorderSide.none
                    ),
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: rePasswordcCont,
                  obscureText: isRePasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    suffixIcon: IconButton(
                      onPressed: showRePw,
                      icon: Icon(isRePasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFf8f4fc),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide.none, // Set borderSide to BorderSide.none
                    ),
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorApp.secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const MainScreen()));
                        widget.onRegisterPressed();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 24),
                        child: Text(
                          'Daftar',
                          style: textApp.bodySmall
                              .copyWith(color: colorApp.light1),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 56,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      ' or sign in with ',
                      style: textApp.largeLabelBlack,
                    ),
                    Container(
                      width: 56,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        width: 45,
                        height: 45,
                        child: Padding(
                          padding: paddingApp.iconPadding,
                          child: SvgPicture.asset('assets/svg/g_logo.svg'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        width: 45,
                        height: 45,
                        child: Padding(
                          padding: paddingApp.iconPadding,
                          child: SvgPicture.asset('assets/svg/fb_logo.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah Memiliki Akun? ',
                      style: textApp.bodySmall.copyWith(
                          color: colorApp.dark1, fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        // widget.onSignUpPressed();
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Masuk',
                        textAlign: TextAlign.start,
                        style: textApp.bodySmall.copyWith(
                            color: const Color(0xFF0063F7),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
