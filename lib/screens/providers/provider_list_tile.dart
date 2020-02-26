import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/screens/providers/provider_access.dart';
// import 'package:provider/provider.dart';

class ProviderListTile extends StatelessWidget {
  final ProviderData provider;

  ProviderListTile({this.provider});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProviderAccess(providerID: provider.providerID),
          ),
        );
      },
      title: Text(provider.company, style: Theme.of(context).textTheme.subhead),
      subtitle: Text(
        provider.datapoints.toString() + ' datapoints shared',
        style: TextStyle(height: 2.0),
      ),
      leading: ClipOval(
        child: Image.asset(
          'images/logos/${provider.logo}',
          width: 50.0,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
