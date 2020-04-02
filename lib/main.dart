import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/authentication/register.dart';
import 'package:idntfy_app/screens/authentication/sign_in.dart';
import 'package:idntfy_app/screens/home/home.dart';
import 'package:idntfy_app/screens/profile/profile.dart';
import 'package:idntfy_app/screens/provider_access/provider_access.dart';
import 'package:idntfy_app/screens/scan/provider_data_request_confirmation.dart';
import 'package:idntfy_app/screens/scan/qr_scan.dart';
import 'package:idntfy_app/screens/wrapper.dart';
import 'package:idntfy_app/services/authentication.dart';
import 'package:idntfy_app/shared/classes/navigation.dart';
import 'package:idntfy_app/shared/styles/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserData>.value(
      value: AuthService().userState,
      child: MaterialApp(
        theme: appTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/confirmation': (context) => ProviderDataRequestConfirmation(),
          '/home': (context) => Home(),
          '/navigation': (context) => Navigation(),
          '/profile': (context) => Profile(),
          '/provideraccess': (context) => ProviderAccess(),
          '/register': (context) => Register(),
          '/scan': (context) => QrScan(),
          '/signin': (context) => SignIn(),
        },
      ),
    );
  }
}
