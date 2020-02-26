import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/providers/provider_list.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/styles/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class Providers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);
    final providers = Provider.of<List<ProviderData>>(context) ?? [];

    providerID() {
      for (var doc in providers) {
        return doc.providerID;
      }
    }

    print(providerID());

    return MultiProvider(
      providers: [
        StreamProvider<List<ProviderData>>.value(
            value:
                DatabaseService(uid: userAuthStream.uid).getProviderCollection),
        StreamProvider<List<UserData>>.value(
            value: DatabaseService(
                    uid: userAuthStream.uid, providerID: providerID())
                .getProviderAccessCollection)
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     CustomIcons.grid,
            //     size: 20.0,
            //   ),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: Icon(
                CustomIcons.search,
                size: 20.0,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 8.0,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 30.0, left: 25.0),
              child: Text(
                'Authorized Providers',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ProviderList(),
            ),
          ],
        ),
      ),
    );
  }
}
