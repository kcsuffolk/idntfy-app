import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:provider/provider.dart';

class ProviderAccessList extends StatelessWidget {
  final String providerID;

  ProviderAccessList({Key key, this.providerID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<User>(context);
    return StreamBuilder(
        stream: DatabaseService(uid: userAuthStream.uid, providerID: providerID)
            .getProviderAccessCollection,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Loading();
          return ListView.separated(
              itemBuilder: (BuildContext context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
              separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                  ),
              itemCount: snapshot.data.documents.length);
        });
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    child: ListTile(
      onTap: () {},
      title: Text('Name', style: Theme.of(context).textTheme.subhead),
      subtitle: Text(
        document['name'],
        style: TextStyle(height: 2.0),
      ),
    ),
  );
}
