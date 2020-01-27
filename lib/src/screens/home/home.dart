import 'package:flutter/material.dart';
import 'package:idntfy_app/src/shared/custom_icons_icons.dart';
import 'package:idntfy_app/src/screens/home/activity_list.dart';
import 'package:idntfy_app/src/screens/profile/profile.dart';
import 'package:idntfy_app/src/screens/scan/qr_scan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ActivityList(),
    QrScan(),
    Profile(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
        onTap: _onTabTapped,
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
}
