import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/home.dart';
import 'package:idntfy_app/screens/profile/emailaddress.dart';
import 'package:idntfy_app/screens/profile/notifications.dart';
import 'package:idntfy_app/screens/profile/profile.dart';
import 'package:idntfy_app/screens/providerAccess.dart';
import 'package:idntfy_app/screens/authorizedProviders.dart';
import 'package:idntfy_app/screens/scan.dart';
import 'package:idntfy_app/screens/profile/address.dart';
import 'package:idntfy_app/widgets/bottomNavigation.dart';

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
              fontSize: 20.0,
              fontWeight: FontWeight.w600),
          subtitle: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      initialRoute: './',
      routes: {
        './': (context) => BottomNavigation(),
        './home': (context) => Home(),
        './scan': (context) => QrScanner(),
        './profile': (context) => Profile(),
        './providers': (context) => AuthorizedProvders(),
        './address': (context) => Address(),
        './emailaddress': (context) => Email(),
        './notifications': (context) => Notifications(),
        './provideraccess': (context) => ProviderAccess(),
      },
    );
  }
}
