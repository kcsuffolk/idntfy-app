import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/authentication/authentication.dart';
import 'package:idntfy_app/shared/classes/navigation.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either home or authentication widget
    if (user == null) {
      return Authentication();
    } else {
      return Navigation();
    }
  }
}
