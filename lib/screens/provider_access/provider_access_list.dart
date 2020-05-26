import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/provider_access/provider_access_list_tile.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:provider/provider.dart';

class ProviderAccessList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerAccess = Provider.of<UserData>(context);

    if (providerAccess == null) return Loading();
    return ListView.separated(
        itemBuilder: (context, index) {
          return ProviderAccessListTile(
              providerAccessDataKey:
                  providerAccess.toMap().keys.toList()[index],
              providerAccessDataValue:
                  providerAccess.toMap().values.toList()[index]);
        },
        separatorBuilder: (context, index) => Divider(thickness: 1),
        itemCount: providerAccess.toMap().keys.length);
  }
}
