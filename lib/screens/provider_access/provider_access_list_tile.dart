import 'package:flutter/material.dart';

class ProviderAccessListTile extends StatelessWidget {
  final String providerAccessDataKey;
  final String providerAccessDataValue;

  ProviderAccessListTile(
      {this.providerAccessDataKey, this.providerAccessDataValue});

  @override
  Widget build(BuildContext context) {
    if (providerAccessDataValue == null) {
      return ListTile(
        title: Text(providerAccessDataKey,
            style: Theme.of(context).textTheme.subhead),
        subtitle: Text(
          'not shared',
          style: TextStyle(height: 2.0),
        ),
        trailing: Icon(Icons.close, color: Colors.red),
      );
    } else {
      return ListTile(
        title: Text(providerAccessDataKey,
            style: Theme.of(context).textTheme.subhead),
        subtitle: Text(
          providerAccessDataValue,
          style: TextStyle(height: 2.0),
        ),
        trailing: Icon(
          Icons.check,
          color: Color(0xFF43D098),
        ),
      );
    }
  }
}
