import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/provider_access/provider_access_list_tile.dart';
import 'package:provider/provider.dart';

class ProviderAccessList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerAccess = Provider.of<DocumentSnapshot>(context);

    return ListView.separated(
        itemBuilder: (context, index) {
          return ProviderAccessListTile(
              providerAccessData: providerAccess.data['email']);
        },
        separatorBuilder: (context, index) => Divider(thickness: 1),
        itemCount: providerAccess.data.length);
  }
}
