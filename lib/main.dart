import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/authentication/register.dart';
import 'package:idntfy_app/screens/authentication/sign_in.dart';
import 'package:idntfy_app/screens/home/activity.dart';
import 'package:idntfy_app/screens/profile/profile.dart';
import 'package:idntfy_app/screens/providers/provider_access.dart';
import 'package:idntfy_app/screens/providers/authorized_providers.dart';
import 'package:idntfy_app/screens/scan/qr_scan.dart';
import 'package:idntfy_app/screens/home/home.dart';
import 'package:idntfy_app/screens/wrapper.dart';
import 'package:idntfy_app/services/authentication.dart';
import 'package:idntfy_app/shared/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: appTheme(),
        initialRoute: './',
        routes: {
          './': (context) => Wrapper(),
          './home': (context) => Home(),
          './activity': (context) => Activity(),
          './scan': (context) => QrScan(),
          './profile': (context) => Profile(),
          './providers': (context) => AuthorizedProviders(),
          './provideraccess': (context) => ProviderAccess(),
          './signin': (context) => SignIn(),
          './register': (context) => Register(),
        },
      ),
    );
  }
}
