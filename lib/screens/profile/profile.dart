import 'package:flutter/material.dart';
import 'package:idntfy_app/services/auth.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
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
                  snapshot.data.name,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(
                    //   Icons.verified_user,
                    //   color: Color(0xff43D098),
                    // ),
                    SizedBox(width: 5.0),
                    Text(
                      'not verified',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data.toMap().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(context,
                              './${snapshot.data.toMap().keys.toList()[index].toLowerCase().replaceAll(' ', '')}');
                        },
                        title: Text(
                          snapshot.data.toMap().keys.toList()[index],
                        ),
                        subtitle: Text(
                          snapshot.data.toMap().values.toList()[index],
                          // style: TextStyle(height: 2.0),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) => Divider(
                      thickness: 1,
                    ),
                  ),
                ),
                FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.do_not_disturb_off),
                      Text('Sign Out'),
                    ],
                  ),
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
