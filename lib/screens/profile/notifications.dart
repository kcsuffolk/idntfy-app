import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
