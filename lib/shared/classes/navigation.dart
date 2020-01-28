import 'package:flutter/material.dart';
import 'package:idntfy_app/shared/styles/custom_icons_icons.dart';
import 'package:idntfy_app/screens/home/home.dart';
import 'package:idntfy_app/screens/profile/profile.dart';
import 'package:idntfy_app/screens/scan/qr_scan.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    QrScan(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF43D098),
        elevation: 15,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.center_focus_strong,
              size: 40.0,
            ),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.profile),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
