import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/providers/provider_access_list.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:provider/provider.dart';

class ProviderAccess extends StatelessWidget {
  final String providerID;

  ProviderAccess({Key key, this.providerID});

  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    return StreamProvider<List<UserData>>.value(
      value: DatabaseService(uid: userAuthStream.uid, providerID: providerID)
          .getProviderAccessCollection,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Provider Access',
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        body: Column(
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                'images/logos/${['logo']}',
                width: 85.0,
              ),
            ),
            Expanded(
              child: ProviderAccessList(),
            ),
          ],
        ),
      ),
    );
  }
}
