import 'package:flutter/material.dart';

class ProviderAccessListTile extends StatelessWidget {
  final String providerAccessDataKey;
  final String providerAccessDataValue;

  ProviderAccessListTile(
      {this.providerAccessDataKey, this.providerAccessDataValue});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(providerAccessDataKey ?? 'not sharing',
          style: Theme.of(context).textTheme.subhead),
      subtitle: Text(
        providerAccessDataValue ?? 'not sharing',
        style: TextStyle(height: 2.0),
      ),
    );
  }
}
