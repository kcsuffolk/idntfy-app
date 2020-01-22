import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/home/activity.dart';
import 'package:idntfy_app/screens/profile/profile.dart';
import 'package:idntfy_app/screens/providers/providerAccess.dart';
import 'package:idntfy_app/screens/providers/authorizedProviders.dart';
import 'package:idntfy_app/screens/home/scan.dart';
import 'package:idntfy_app/screens/profile/address.dart';
import 'package:idntfy_app/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF101D15),
          ),
          subtitle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 19.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF101D15),
          ),
          subhead: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF101D15),
          ),
        ),
      ),
      initialRoute: './',
      routes: {
        './': (context) => Home(),
        './home': (context) => Activity(),
        './scan': (context) => QrScanner(),
        './profile': (context) => Profile(),
        './providers': (context) => AuthorizedProviders(),
        './address': (context) => Address(),
        './provideraccess': (context) => ProviderAccess(),
      },
    );
  }
}
