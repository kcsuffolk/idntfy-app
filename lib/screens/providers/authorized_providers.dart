import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/providers/provider_access.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:idntfy_app/shared/styles/custom_icons_icons.dart';
import 'package:idntfy_app/models/user_data.dart';
import 'package:provider/provider.dart';

class AuthorizedProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);

    return Scaffold(
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
          StreamBuilder(
              stream: DatabaseService(uid: userAuthStream.uid)
                  .getProviderCollection,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Loading();

                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, index) =>
                        _buildListItem(context, snapshot.data.documents[index]),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  if (document.data.length < 1) {
    return Container(
      padding: EdgeInsets.only(left: 25.0),
      child: Text(
        'The providers that are authorized to access your data will be listed here',
        style: TextStyle(height: 1.5),
      ),
    );
  } else {
    return Container(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProviderAccess(providerID: document.documentID),
            ),
          );
        },
        title: Text(document['company'],
            style: Theme.of(context).textTheme.subhead),
        subtitle: Text(
          document['datapoints'].toString() + ' datapoints shared',
          style: TextStyle(height: 2.0),
        ),
        leading: ClipOval(
          child: Image.asset(
            'images/logos/${document['logo']}',
            width: 50.0,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
