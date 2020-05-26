import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/screens/provider_access/provider_access.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:provider/provider.dart';

class ProviderListTile extends StatelessWidget {
  final ProviderData provider;

  ProviderListTile({this.provider});

  @override
  Widget build(BuildContext context) {
    final providerAccess = Provider.of<DocumentSnapshot>(context);

    if (providerAccess == null) return Loading();
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProviderAccess(
                providerID: provider.providerID,
                providerName: provider.company,
                providerLogo: provider.logo),
          ),
        );
      },
      title:
          Text(provider.company, style: Theme.of(context).textTheme.subtitle1),
      subtitle: Text(
        providerAccess.data.length.toString() + ' datapoints shared',
        style: TextStyle(height: 2.0),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image(
          image: AssetImage('images/logos/${provider.logo}'),
          fit: BoxFit.contain,
        ),
        radius: 20.0,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
