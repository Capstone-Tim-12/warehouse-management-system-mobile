import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/classes/icons_collection.dart';
import 'package:flutter/material.dart';

// import '../../classes/icons_collection.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  ColorApp colorApp = ColorApp();
  TextCollection textApp = TextCollection();
  IconsCollection icons = IconsCollection();
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
              Container(
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
                      "Yuniar Awaliah",
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
                  onTap: () {},
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
                    Icons.person_3_outlined,
                    color: colorApp.mainColorDarker,
                  ),
                  title: const Text("Verifikasi Identitas"),
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
                  title: const Text("Lokasi"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {},
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
                  title: const Text("Log Out"),
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: colorApp.mainColorDarker,
                  ),
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
