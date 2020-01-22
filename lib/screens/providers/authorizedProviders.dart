import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/presentation/custom_icons_icons.dart';

class AuthorizedProviders extends StatefulWidget {
  @override
  _AuthorizedProvidersState createState() => _AuthorizedProvidersState();
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
    child: ListTile(
      onTap: () {},
      title: Text(
        document['name'],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      subtitle: Text(
        document['datapoints'].toString() + ' datapoints shared',
        style: TextStyle(height: 1.8),
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

class _AuthorizedProvidersState extends State<AuthorizedProviders> {
  @override
  Widget build(BuildContext context) {
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
          IconButton(
            icon: Icon(
              CustomIcons.grid,
              size: 20.0,
            ),
            onPressed: () {},
          ),
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
      body: SafeArea(
        child: Column(
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
                stream: Firestore.instance.collection('providers').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Text('Loading...');
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, index) =>
                          _buildListItem(
                              context, snapshot.data.documents[index]),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
