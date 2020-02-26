import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/providers/provider_access_list_tile.dart';
import 'package:provider/provider.dart';

class ProviderAccessList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerAccess = Provider.of<List<UserData>>(context) ?? [];

    return ListView.separated(
        itemBuilder: (context, index) {
          return ProviderAccessListTile(
              providerAccessData: providerAccess[index]);
        },
        separatorBuilder: (context, index) => Divider(thickness: 1),
        itemCount: providerAccess.length);
  }
}
