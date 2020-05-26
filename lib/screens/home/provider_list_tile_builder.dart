import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/home/provider_list_tile.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:provider/provider.dart';

class ProviderListTileBuilder extends StatelessWidget {
  final ProviderData provider;

  ProviderListTileBuilder({this.provider});

  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    return StreamProvider<DocumentSnapshot>.value(
      value: DatabaseService(
              uid: userAuthStream.uid,
              providerID: provider.providerID,
              providerAccessRef: userAuthStream.uid)
          .getProviderAccessDocumentCount,
      child: ProviderListTile(provider: provider),
    );
  }
}
