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
    const ChatScreen(),
    const SetProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warehouse),
              label: 'MyWarehouse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: _screens[_screenIndex],
    );
  }
}
