import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/provider_access/provider_access_list.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:provider/provider.dart';

class ProviderAccess extends StatelessWidget {
  final String providerID;
  final String providerName;
  final String providerLogo;

  ProviderAccess({this.providerID, this.providerName, this.providerLogo});

  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    return StreamProvider<DocumentSnapshot>.value(
      value: DatabaseService(
              uid: userAuthStream.uid,
              providerID: providerID,
              providerAccessRef: userAuthStream.uid)
          .getProviderAccessDocument,
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
                'images/logos/$providerLogo',
                width: 50.0,
              ),
            ),
            SizedBox(height: 50.0),
            Expanded(
              child: ProviderAccessList(),
            ),
          ],
        ),
      ),
    );
  }
}
