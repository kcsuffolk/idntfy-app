import 'package:flutter/material.dart';

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
