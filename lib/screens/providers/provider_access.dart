import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/providers/provider_access_list.dart';

class ProviderAccess extends StatelessWidget {
  final String providerID;
  final String providerAccessRef;

  ProviderAccess({Key key, this.providerID, this.providerAccessRef})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Provider Access',
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
      body: Column(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              'images/logos/${['logo']}',
              width: 85.0,
            ),
          ),
          Expanded(
            child: ProviderAccessList(providerID: providerID),
          ),
        ],
      ),
    );
  }
}
