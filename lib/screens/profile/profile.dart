import 'package:flutter/material.dart';

import 'package:idntfy_app/services/authentication.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 55.0),
          CircleAvatar(
            backgroundImage: AssetImage('images/faces/face.png'),
            radius: 40.0,
          ),
          SizedBox(height: 15.0),
          Text(
            'Test',
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.verified_user,
                color: Color(0xff43D098),
              ),
              SizedBox(width: 5.0),
              Text(
                'verified',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(
                thickness: 1,
              ),
            ),
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.highlight_off,
              color: Colors.red,
            ),
            label: Text('Sign out'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
