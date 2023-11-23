import 'package:flutter/material.dart';
import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/size_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';

class BottomSheetNewPW extends StatefulWidget {
  const BottomSheetNewPW({super.key, required this.onPWConfirmedPressed});

  final VoidCallback onPWConfirmedPressed;

  @override
  State<BottomSheetNewPW> createState() => _BottomSheetNewPWState();
}

class _BottomSheetNewPWState extends State<BottomSheetNewPW> {
  TextEditingController newPwCont = TextEditingController();
  TextEditingController reNewPwCont = TextEditingController();
  bool isPasswordVisible = false;
  bool isNewPasswordVisible = true;

  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPasswordVisible = false;
    isNewPasswordVisible = false;
  }

  void showPw() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void showNewPw() {
    setState(() {
      isNewPasswordVisible = !isNewPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.3585,
        height: MediaQuery.of(context).size.height * 0.456,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            )),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.0561,
            right: MediaQuery.of(context).size.width * 0.0561,
            top: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Kata Sandi',
                style: textApp.heading4,
              ),
              Text(
                'Aturlah kata sandi yang baru untuk akun anda agar dapat login dan mengakses semua fitur yang tersedia',
                style: textApp.bodySmall
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(
                height: 11,
              ),
              TextField(
                controller: newPwCont,
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  hintText: 'Masukkan Kata Sandi Baru',
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
                height: 10,
              ),
              TextField(
                controller: reNewPwCont,
                obscureText: isNewPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Ulang Kata Sandi',
                  hintText: 'Masukkan Kembali Kata Sandi',
                  suffixIcon: IconButton(
                    onPressed: showNewPw,
                    icon: Icon(isNewPasswordVisible
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
                      widget.onPWConfirmedPressed();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 24),
                      child: Text(
                        'Ganti Kata Sandi',
                        style:
                            textApp.bodySmall.copyWith(color: colorApp.light1),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
