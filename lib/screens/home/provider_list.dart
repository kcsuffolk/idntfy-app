import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/screens/home/provider_list_tile_builder.dart';
import 'package:provider/provider.dart';

class ProviderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<List<ProviderData>>(context) ?? [];

    if (providers.length == 0) {
      return Container(
        padding: EdgeInsets.only(left: 25.0),
        child: Text(
          'All providers that have access to your data will be displayed here',
          style: TextStyle(height: 1.5),
        ),
      );
    } else {
      return ListView.separated(
        itemBuilder: (context, index) {
          return ProviderListTileBuilder(provider: providers[index]);
        },
        separatorBuilder: (context, index) => Divider(thickness: 1),
        itemCount: providers.length,
      );
    }
  }
}
