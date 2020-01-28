import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/profile/user_form.dart';
import 'package:idntfy_app/services/auth.dart';
import 'package:idntfy_app/services/database.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return StreamBuilder<Object>(
        stream: null,
=======
    final user = Provider.of<User>(context);
    void _showSettingsPanel() {
      showModalBottomSheet(
          isDismissible: true,
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: UserForm(),
            );
          });
    }

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
>>>>>>> parent of cc1b845... Rollback
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
<<<<<<< HEAD
                        onTap: () {
                          print(DatabaseService().userCollection);
                        },
                        title: Text('Test'
                            // snapshot.data.keys.toList()[index],
                            ),
                        subtitle: Text('Test'
                            // snapshot.data.toMap().values.toList()[index],
                            // style: TextStyle(height: 2.0),
                            ),
=======
                        onTap: () => _showSettingsPanel(),
                        title: Text(
                          snapshot.data.toMap().keys.toList()[index],
                        ),
                        subtitle: Text(
                          snapshot.data.toMap().values.toList()[index],
                          // style: TextStyle(height: 2.0),
                        ),
>>>>>>> parent of cc1b845... Rollback
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
        });
  }
}
