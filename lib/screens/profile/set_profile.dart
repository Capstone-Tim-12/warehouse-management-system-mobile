import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:flutter/material.dart';

import '../../classes/icons_collection.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  ColorApp colorApp = ColorApp();
  IconsCollection icons = IconsCollection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: colorApp.dark4,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15.0,
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: colorApp.secondaryColor,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Settings",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        const CircleAvatar(
                          radius: 70.0,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/200/300?random=1'),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Photo Profile"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Identity Verification"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Account Verification"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Username"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Email"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Profile"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.pin_drop,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Location"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("History"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Notification"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: colorApp.secondaryColor,
                      ),
                      title: const Text("Log Out"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorApp.secondaryColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
