import 'package:flutter/material.dart';
import 'package:idntfy_app/src/models/user.dart';
import 'package:idntfy_app/src/screens/authentication/authentication.dart';
import 'package:idntfy_app/src/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either home or authentication widget
    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
