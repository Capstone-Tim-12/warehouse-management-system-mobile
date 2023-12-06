import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/screens/main/chatbot/chatscreen.dart';
import 'package:capstone_wms/screens/main/dashboard/dashboard.dart';
import 'package:capstone_wms/screens/main/favorites/favorite_screen.dart';
import 'package:capstone_wms/screens/main/my_warehouse/my_warehouse_screen.dart';
import 'package:capstone_wms/screens/main/profile/set_profile.dart';
// import 'package:capstone_wms/screens/main/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ColorApp appColor = ColorApp();

  int _screenIndex = 0;

  final List<Widget> _screens = [
    const Dashboard(),
    const FavoritesScreen(),
    const MyWarehouse(),
    // const ChatScreen(),
    const SetProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // type: BottomNavigationBarType.shifting,
            backgroundColor: appColor.mainColor,
            selectedItemColor: appColor.secondaryColor,
            unselectedItemColor: Colors.white,
            currentIndex: _screenIndex,
            // fixedColor: appColor.mainColor,
            onTap: (index) {
              setState(() {
                _screenIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                backgroundColor: appColor.secondaryColor,
                activeIcon: CircleAvatar(
                  backgroundColor: appColor.secondaryColor,
                  child: Icon(Icons.home, color: appColor.light1),
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                activeIcon: CircleAvatar(
                  backgroundColor: appColor.secondaryColor,
                  child: Icon(Icons.star, color: appColor.light1),
                ),
                label: 'Favorit',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.warehouse_rounded),
                activeIcon: CircleAvatar(
                  backgroundColor: appColor.secondaryColor,
                  child: Icon(Icons.warehouse_rounded, color: appColor.light1),
                ),
                label: 'Gudfangku',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.chat),
              //   label: 'Chats',
              // ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                activeIcon: CircleAvatar(
                  backgroundColor: appColor.secondaryColor,
                  child: Icon(Icons.person, color: appColor.light1),
                ),
                label: 'Profil',
              ),
            ]),
      ),
      body: _screens[_screenIndex],
    );
  }
}
