import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/authentication/authentication.dart';
import 'package:idntfy_app/shared/classes/navigation.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    if (userAuthStream.uid == null) {
      return Authentication();
    } else {
      return Navigation();
    }
  }
}
