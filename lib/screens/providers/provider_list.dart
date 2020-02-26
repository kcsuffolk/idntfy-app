import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/screens/providers/provider_list_tile.dart';
import 'package:provider/provider.dart';

class ProviderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<List<ProviderData>>(context) ?? [];

    return ListView.builder(
      itemBuilder: (context, index) {
        return ProviderListTile(provider: providers[index]);
      },
      itemCount: providers.length,
    );
  }
}
