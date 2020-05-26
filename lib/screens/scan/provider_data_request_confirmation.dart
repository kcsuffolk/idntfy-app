import 'package:flutter/material.dart';

class ProviderDataRequestConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                size: 60.0,
                color: Color(0xFF43D098),
              ),
              SizedBox(height: 24.0),
              Text('You now have access'),
            ]),
      ),
    );
  }
}
