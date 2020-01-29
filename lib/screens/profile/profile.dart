import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/profile/profile_list.dart';
import 'package:idntfy_app/services/authentication.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final _userAuthStream = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: _userAuthStream.uid).getUserDocuments,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                SizedBox(height: 55.0),
                CircleAvatar(
                  backgroundImage: AssetImage('images/faces/face.png'),
                  radius: 35.0,
                ),
                SizedBox(height: 15.0),
                Text(
                  snapshot.data.name,
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
                      style:
                          TextStyle(fontFamily: 'Poppins', color: Colors.black),
                    )
                  ],
                ),
                Expanded(
                  child: ProfileList(),
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
        });
  }
}
