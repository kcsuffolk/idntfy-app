import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';

class ProviderAccessListTile extends StatelessWidget {
  final String providerAccessData;

  ProviderAccessListTile({this.providerAccessData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(providerAccessData),
    );
  }
}
