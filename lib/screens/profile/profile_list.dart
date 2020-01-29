import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:provider/provider.dart';

class ProfileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userAuthStream = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: _userAuthStream.uid).getUserDocuments,
        builder: (context, snapshot) {
          return Expanded(
            child: ListView.separated(
              itemCount: snapshot.data.toMap().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data.toMap().keys.toList()[index]),
                  subtitle: Text(snapshot.data.toMap().values.toList()[index]),
                  onTap: () {},
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(
                thickness: 1,
              ),
            ),
          );
        });
  }
}
