import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:provider/provider.dart';
import 'package:idntfy_app/models/user.dart';

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<User>(context);
    return StreamBuilder(
        stream: DatabaseService(uid: userAuthStream.uid).getProviderCollection,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Loading();
          return Expanded(
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
              separatorBuilder: (BuildContext context, index) => Divider(
                thickness: 1,
              ),
            ),
          );
        });
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    child: ListTile(
      onTap: () {
        // Navigator.pushNamed(context, './provideraccess');
      },
      title:
          Text(document['company'], style: Theme.of(context).textTheme.subhead),
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
