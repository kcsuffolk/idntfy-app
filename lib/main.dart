import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/home.dart';
import 'package:idntfy_app/screens/profile/emailaddress.dart';
import 'package:idntfy_app/screens/profile/notifications.dart';
import 'package:idntfy_app/screens/profile/profile.dart';
import 'package:idntfy_app/screens/scan.dart';
import 'package:idntfy_app/screens/profile/address.dart';
import 'package:idntfy_app/widgets/bottomNavigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: './',
      routes: {
        '/': (context) => BottomNavigation(),
        './home': (context) => Home(),
        './scan': (context) => QRScanner(),
        './profile': (context) => Profile(),
        './address': (context) => Address(),
        './emailaddress': (context) => Email(),
        './notifications': (context) => Notifications(),
      },
    );
  }
}
