import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/services/database.dart';

class ProviderRequest extends StatelessWidget {
  final String providerID;

  ProviderRequest({this.providerID});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProviderData>(
        stream: DatabaseService(providerID: providerID).getProviderData,
        builder: (context, snapshot) {
          ProviderData providerData = snapshot.data;

          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: 160.0),
                Center(
                  child: Text(providerData.company +
                      ' is asking you to share the following data'),
                ),
              ],
            ),
          );
        });
  }
}
