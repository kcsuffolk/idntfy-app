import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idntfy_app/presentation/custom_icons_icons.dart';

class Providers extends StatefulWidget {
  @override
  _ProvidersState createState() => _ProvidersState();
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
    child: ListTile(
      onTap: () {},
      title: Text(
        document['name'],
        style: TextStyle(
            fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      subtitle: Text(
        document['datapoints'].toString() + ' datapoints shared',
        style: TextStyle(fontFamily: 'Inter', fontSize: 14.0, height: 1.8),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/logos/${document['logo']}'),
        radius: 22.5,
        // NetworkImage(
        //     'https://www.google.com/s2/favicons?domain=www.${document['domain']}'),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  );
}

class _ProvidersState extends State<Providers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          Container(
            width: 75.0,
            margin: EdgeInsets.only(right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  CustomIcons.search,
                  color: Colors.black,
                ),
                Icon(CustomIcons.grid, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Text(
                'Authorized Providers',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
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
