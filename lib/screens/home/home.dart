import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/home/provider_list.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/styles/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    return StreamProvider<List<ProviderData>>.value(
      value: DatabaseService(uid: userAuthStream.uid).getProviderCollection,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                CustomIcons.search,
                size: 20.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/providers');
              },
            ),
            SizedBox(width: 8.0),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 30.0, left: 25.0),
              child: Text(
                'Authorized Providers',
                style: Theme.of(context).textTheme.headline6,
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
