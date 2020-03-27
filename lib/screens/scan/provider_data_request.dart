import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:provider/provider.dart';

class ProviderDataRequest extends StatefulWidget {
  @override
  _ProviderDataRequestState createState() => _ProviderDataRequestState();
}

class _ProviderDataRequestState extends State<ProviderDataRequest> {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: userAuthStream.uid).getUserDocuments,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Loading();
          UserData userData = snapshot.data;

          return ListView.separated(
            itemCount: userData.toMap().length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userData.toMap().keys.toList()[index],
                    style: Theme.of(context).textTheme.subhead),
                subtitle: Text(userData.toMap().values.toList()[index],
                    style: TextStyle(height: 2.0)),
                trailing: Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFF43D098),
                ),
              );
            },
            separatorBuilder: (BuildContext context, index) => Divider(
              thickness: 1,
            ),
          );
        });
  }
}
