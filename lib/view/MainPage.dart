import 'package:flutter/material.dart';
import 'package:todo/view/AppMainScreens/AddPage.dart';
import 'package:todo/view/AppMainScreens/HomePage.dart';
import 'package:todo/view/AppMainScreens/ProfilePage.dart';
import 'package:todo/view/SignUpPage/Sign_Up_Page.dart';
import 'package:todo/view/SignInPage/Sign_In_Page.dart';

import '../repositories/register_user.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: [HomePage(),AddPage(),ProfilePage()][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 35,
          selectedItemColor: Colors.blue,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
