import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/showdialogotp.dart';
import 'package:capstone_wms/controllers/profile_controller.dart';
import 'package:capstone_wms/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifikasi extends StatefulWidget {
  EmailVerifikasi({super.key, required this.email});

  String email;

  @override
  State<EmailVerifikasi> createState() => _EmailVerifikasiState();
}

class _EmailVerifikasiState extends State<EmailVerifikasi> {
  AuthService auth = AuthService();

  ProfileController profileCont = Get.put(ProfileController());

  TextEditingController newEmailCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: colorApp.dark4, //change your color here
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Pengaturan Email",
          style: TextCollection().heading5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Card(
                elevation: 1,
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: colorApp.mainColorDarker,
                        child: Icon(
                          Icons.email,
                          color: colorApp.secondaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.email,
                        style: TextCollection().bodyNormal,
                      ),
                      const SizedBox(height: 2),
                      const Text("Email terverifikasi"),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: colorApp.mainColor,
                            isScrollControlled: true,
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
                                      0.265,
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
                                                "Email",
                                                style: TextCollection()
                                                    .heading6White,
                                              ),
                                              // const SizedBox(
                                              //   width: 120,
                                              // ),

                                              // Obx(() => )
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
                                              style: TextCollection()
                                                  .bodySmall
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                              controller: newEmailCont,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelText: "Email",
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Obx(() => ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      colorApp.secondaryColor,
                                                  disabledBackgroundColor:
                                                      colorApp
                                                          .secondaryColorLighter,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                ),
                                                onPressed: profileCont
                                                        .isUpdateLoading.value
                                                    ? null
                                                    : () async {
                                                        BuildContext ctx =
                                                            context;
                                                        await profileCont
                                                            .updateUserEmail(
                                                                newEmailCont
                                                                    .text,
                                                                ctx);
                                                        // auth.resendOTP();
                                                        //  await AuthService.resendOTP(email);
                                                        // showDialogOtp(context);
                                                      },
                                                // onPressed: () {
                                                //   showDialogOtp(context,
                                                //       newEmailCont.text);
                                                // },
                                                child: Text(
                                                  "Kirim Kode",
                                                  style: TextCollection()
                                                      .heading6White,
                                                  selectionColor:
                                                      colorApp.light1,
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: colorApp.secondaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Ubah Alamat Email",
                              style: TextCollection().bodySmall.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: colorApp.light1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Card(
                elevation: 1,
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "FAQ",
                          style: TextCollection().bodyNormal,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Bagaimana cara mengubah alamat email ?",
                          style: TextCollection().bodySmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  title: Text(
                                    'Q: Bagaimana Cara Mengubah Alamat Email?',
                                    style: TextCollection().bodyNormal,
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'A: Untuk mengubah alamat email anda dapat menuju setting, kemudian pada halaman setting akan ada sebuah tombol yang bertuliskan email, kemudian jika anda menekan tombol itu maka anda akan diarahkan ke halaman untuk mengubah alamat email. Kemudian pada halaman itu akan terdapat sebuah tombol dengan tulisan ubah alamat email setelah itu anda dapat menekan tombol tersebut dan ikuti petunjuknya sampai dengan selesai',
                                        style: TextCollection()
                                            .bodySmall
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.arrow_right_rounded),
                          color: colorApp.mainColorDarker,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Bagaimana agar alamat email dapat terverifikasi ?",
                          style: TextCollection().bodySmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  title: Text(
                                    'Q: Bagaimana cara agar alamat email dapat terverifikasi?',
                                    style: TextCollection().bodyNormal,
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'A: Email anda akan terverifikasi secara otomatis pada saat anda daftar melalui aplikasi, namun ketika menggati alamat email baru anda dapat memasukan OTP yang didapatkan dari pesan pada email anda ketika melakukan submit email baru anda',
                                        style: TextCollection()
                                            .bodySmall
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.arrow_right_rounded),
                          color: colorApp.mainColorDarker,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
