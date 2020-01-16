import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idntfy_app/presentation/custom_icons_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
    child: ListTile(
      onTap: () {},
      title: Text(document['name']),
      subtitle: Text(document['datapoints'].toString() + ' datapoints shared'),
      // leading: CircleAvatar(
      //   backgroundImage: AssetImage(
      //       'images/logos/${lastTransaction[index].logo}'),
      //   radius: 22.5,
    ),
  );
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                IconButton(
                  icon: Icon(CustomIcons.grid),
                  iconSize: 18.0,
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: Icon(CustomIcons.search),
                    iconSize: 18.0,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Latest Transactions',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            StreamBuilder(
                stream: Firestore.instance.collection('providers').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => _buildListItem(
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
