import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user_data.dart';
import 'package:idntfy_app/screens/profile/profile_edit.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:provider/provider.dart';

class ProfileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: userAuthStream.uid).getUserDocuments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return ListView.separated(
              itemCount: userData.toMap().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userData.toMap().keys.toList()[index],
                      style: Theme.of(context).textTheme.subhead),
                  subtitle: Text(userData.toMap().values.toList()[index],
                      style: TextStyle(height: 2.0)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileEdit()));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(
                thickness: 1,
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
