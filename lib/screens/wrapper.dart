import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/authentication/authentication.dart';
import 'package:idntfy_app/services/authentication.dart';
import 'package:idntfy_app/shared/classes/navigation.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: AuthService().userState,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Authentication();
          } else {
            return Navigation();
          }
        });
  }
}
