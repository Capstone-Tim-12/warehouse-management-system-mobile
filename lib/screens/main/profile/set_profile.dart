import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/alertverified.dart';
import 'package:capstone_wms/components/bs_settingfotoprofil.dart';
import 'package:capstone_wms/controllers/profile_controller.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/idverconf.dart';
import 'package:capstone_wms/screens/main/history/history_screen.dart';
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
  ProfileController profileCont = Get.put(ProfileController());

  FirebaseServices checkUserVerification = FirebaseServices();

  TextEditingController usernameCont = TextEditingController();

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userId');
    prefs.remove('name');
    prefs.remove('token');
    prefs.remove('email');
    prefs.remove('userDoc');

    Get.off(() => const SplashScreen());
  }

  void setUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId')!;
      username = prefs.getString('name')!;
    });
  }

  void getuser() async {
    await profileCont.getUserInfo();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUid();
    // profileCont.getUserInfo();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => profileCont.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: colorApp.mainColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          Obx(
                            () => CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  NetworkImage(profileCont.userInfo['photo']),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            profileCont.userInfo['username'],
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
                          style: textApp.bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
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
                        title: const Text("Username"),
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          color: colorApp.mainColorDarker,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: colorApp.mainColor,
                            isScrollControlled: true,
                            enableDrag: !profileCont.isUpdateLoading.value
                                ? true
                                : false,
                            isDismissible: !profileCont.isUpdateLoading.value
                                ? true
                                : false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height *
                                      0.201,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back,
                                                  color:
                                                      colorApp.secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                "Username",
                                                style: TextCollection()
                                                    .heading6White,
                                              ),
                                              const SizedBox(
                                                width: 120,
                                              ),
                                              Obx(() => ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: colorApp
                                                          .secondaryColor,
                                                      disabledBackgroundColor:
                                                          colorApp
                                                              .secondaryColorLighter,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                    onPressed: profileCont
                                                            .isUpdateLoading
                                                            .value
                                                        ? null
                                                        : () async {
                                                            if (usernameCont
                                                                    .text
                                                                    .length <=
                                                                6) {
                                                              Get.snackbar(
                                                                  "Peringatan",
                                                                  "Username Minimal 6 Digit");
                                                            } else {
                                                              await profileCont
                                                                  .updateUsername(
                                                                      usernameCont
                                                                          .text);
                                                              profileCont
                                                                  .getUserInfo();
                                                              Get.back();
                                                            }
                                                          },
                                                    child: Text(
                                                      "Ganti",
                                                      style: TextCollection()
                                                          .heading6White,
                                                      selectionColor:
                                                          colorApp.light1,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: colorApp.light4),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: TextField(
                                              style: textApp.bodySmall.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                              controller: usernameCont,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelText: "Username",
                                                labelStyle: TextStyle(
                                                  color: colorApp.light4,
                                                ),
                                                icon: Icon(
                                                  Icons.person,
                                                  color: colorApp.light4,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
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
                          Get.to(() => EmailVerifikasi(
                                email: profileCont.userInfo['email'],
                              ));
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
                          // bool cekUser = await checkUserVerification
                          //     .checkUserIsVerified(userId);
                          print(profileCont.userInfo['isVerifyIdentity']);
                          if (profileCont.userInfo['isVerifyIdentity']) {
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
                        onTap: () {
                          Get.to(() => HistoryScreen());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListTile(
                        leading: Icon(
                          Icons.notifications_active,
                          color: colorApp.mainColorDarker,
                        ),
                        title: const Text("Notifikasi"),
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          color: colorApp.mainColorDarker,
                        ),
                        onTap: () {
                          Get.to(() => const NotificationScreen());
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
                                  style: textApp.heading5
                                      .copyWith(color: colorApp.mainColor),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: colorApp.light4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                    width: 1,
                                                    color: colorApp
                                                        .secondaryColor),
                                              )),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Batalkan',
                                            style: textApp.extraSmallInvLabel
                                                .copyWith(
                                                    color: colorApp
                                                        .secondaryColor),
                                          )),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  colorApp.secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          onPressed: () {
                                            logout(context);
                                          },
                                          child: Text(
                                            'Konfirmasi',
                                            style: textApp.extraSmallInvLabel
                                                .copyWith(
                                                    color: colorApp.light4),
                                          )),
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
    ));
  }
}
