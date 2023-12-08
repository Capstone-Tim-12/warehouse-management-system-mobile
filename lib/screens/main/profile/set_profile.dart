import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/alertverified.dart';
import 'package:capstone_wms/components/bs_settingfotoprofil.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/idverconf.dart';
import 'package:capstone_wms/screens/main/profile/emailverifikasi.dart';
import 'package:capstone_wms/screens/main/profile/notification_screen.dart';
import 'package:capstone_wms/screens/main/profile/set_location.dart';
import 'package:capstone_wms/screens/main/profile/verifikasi_identitas.dart';
import 'package:capstone_wms/screens/splashscreen.dart';
import 'package:capstone_wms/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../classes/icons_collection.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  int userId = 0;
  String username = '';

  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();
  IconsCollection icons = IconsCollection();

  FirebaseServices checkUserVerification = FirebaseServices();

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear data from SharedPreferences
    prefs.remove('userId');
    prefs.remove('name');
    prefs.remove('token');
    prefs.remove('email');
    prefs.remove('userDoc');

    // Navigate back to the splash screen
    Get.off(() => const SplashScreen());
  }

  void setUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId')!;
      username = prefs.getString('name')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://picsum.photos/200/300?random=1'),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      username,
                      style: textApp.bodyNormal,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Akun",
                  style: textApp.bodyNormal,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.camera_alt_sharp,
                    color: colorApp.mainColorDarker,
                  ),
                  title: Text(
                    "Foto Profil",
                    style: textApp.bodySmall,
                  ),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {
                    bottomSheetFotoProfil(context);
                  },
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.edit_note_outlined,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Nama Lengkap"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Email"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailVerifikasi(),
                      ),
                    );
                    // Get.to(() => const StartVerification());
                  },
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.person_3_outlined,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Verifikasi Identitas"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () async {
                    bool cekUser =
                        await checkUserVerification.checkUserIsVerified(userId);
                    print(cekUser);
                    if (cekUser) {
                      alertVerified(context);
                      // Get.to(const VerifikasiIdentitas());
                    } else {
                      Get.to(const StartVerification());
                    }
                  },
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.pin_drop,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Lokasi"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetLocation(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Aktivitas",
                  style: textApp.bodyNormal,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.history,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Riwayat Gudang"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.pin_drop,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Location"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("History"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Notification"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {
                    Get.to(NotificationScreen());
                  },
                ),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Log Out"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: colorApp.light4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: Text(
                            'Keluar Akun',
                            style: textApp.heading5.copyWith(color: colorApp.mainColor),
                            textAlign: TextAlign.center,
                            ),
                          content: Text(
                            'Kamu akan kembali ke halaman login',
                            style: textApp.smallLabelBlackclear.copyWith(
                              color: colorApp.mainColor,
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorApp.light4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(width: 1, color: colorApp.secondaryColor),
                                    )
                                  ),
                                      onPressed: () {
                                        Get.back();
                                      }, 
                                      child: Text(
                                        'Batalkan',
                                        style: textApp.extraSmallInvLabel.copyWith(
                                        color: colorApp.secondaryColor
                                      ),
                                        )
                                      ),
                                    ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: colorApp.secondaryColor,
                                        shape: RoundedRectangleBorder(
                                        borderRadius:BorderRadius.circular(8))),
                                    onPressed: () {
                                      logout(context);
                                    },
                                    child: Text(
                                      'Konfirmasi',
                                      style: textApp.extraSmallInvLabel.copyWith(
                                        color: colorApp.light4
                                      ),
                                    )
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
