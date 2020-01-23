import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/authentication/register.dart';
import 'package:idntfy_app/screens/authentication/sign_in.dart';
import 'package:idntfy_app/screens/home/activity.dart';
import 'package:idntfy_app/screens/profile/profile.dart';
import 'package:idntfy_app/screens/providers/providerAccess.dart';
import 'package:idntfy_app/screens/providers/authorizedProviders.dart';
import 'package:idntfy_app/screens/scan/qrScan.dart';
import 'package:idntfy_app/screens/profile/address.dart';
import 'package:idntfy_app/screens/home/home.dart';
import 'package:idntfy_app/screens/wrapper.dart';
import 'package:idntfy_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
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
            display1: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF101D15),
            ),
            body1: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF3F4441),
            ),
          ),
        ),
        initialRoute: './',
        routes: {
          './': (context) => Wrapper(),
          './home': (context) => Home(),
          './activity': (context) => Activity(),
          './scan': (context) => QrScan(),
          './profile': (context) => Profile(),
          './providers': (context) => AuthorizedProviders(),
          './address': (context) => Address(),
          './provideraccess': (context) => ProviderAccess(),
          './signin': (context) => SignIn(),
          './register': (context) => Register(),
        },
      ),
    );
  }
}
