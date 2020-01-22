import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authentication widget
    return Home();
  }
}
