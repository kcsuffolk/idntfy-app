import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 150.0),
          Image.asset('images/share.png'),
          SizedBox(height: 90.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'You decide what you share.',
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'You own your data. You control how and when you want to share it.',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 145.0,
          ),
          SizedBox(height: 30.0),
          Image.asset('image/indicator_3.png'),
          SizedBox(
            width: 300.0,
            height: 55.0,
            child: FlatButton(
              color: Color(0xFF43D098),
              colorBrightness: Brightness.dark,
              child: Text(
                'Register',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.pushNamed(context, './register'),
            ),
          ),
          SizedBox(
            width: 300.0,
            height: 55.0,
            child: FlatButton(
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, './signin');
                }),
          ),
        ],
      ),
    );
  }
}
