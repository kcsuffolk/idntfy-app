import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.important_devices),
            onPressed: () {
              Navigator.pushNamed(context, './providers');
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
              'Your Activity',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
          ),
          StreamBuilder(
              stream: Firestore.instance.collection('providers').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
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
              }),
        ],
      ),
    );
  }
}

// List Widget for "Latest Activity"
Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(context, './provideraccess');
      },
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
