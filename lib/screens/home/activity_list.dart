import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/screens/providers/provider_list_tile.dart';
import 'package:provider/provider.dart';

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<List<ProviderData>>(context) ?? [];

    if (providers.length > 1) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return ProviderListTile(provider: providers[index]);
          },
          separatorBuilder: (context, index) => Divider(thickness: 1),
          itemCount: providers.length);
    } else {
      return Container(
        padding: EdgeInsets.only(left: 25.0),
        child: Text(
          'Your account history will be displayed here',
          style: TextStyle(height: 1.5),
        ),
      );
    }
  }
}
