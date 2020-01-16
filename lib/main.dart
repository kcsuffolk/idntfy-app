import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/Home.dart';
import 'package:idntfy_app/screens/Profile.dart';
import 'package:idntfy_app/screens/Scan.dart';
import 'package:idntfy_app/screens/Wrapper.dart';
import 'package:idntfy_app/screens/Account.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: './',
      routes: {
        '/': (context) => Wrapper(),
        './home': (context) => Home(),
        './scan': (context) => QRScanner(),
        './profile': (context) => Profile(),
        './account': (context) => Account(),
      },
    );
  }
}
