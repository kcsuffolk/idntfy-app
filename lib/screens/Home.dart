import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
    child: ListTile(
      onTap: () {},
      title: Text(document['name']),
      subtitle: Text(document['datapoints'].toString() + ' datapoints shared'),
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/logos/${document['logo']}'),
        radius: 22.5,
        // NetworkImage(
        //     'https://www.google.com/s2/favicons?domain=www.${document['domain']}'),
      ),
    ),
  );
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Text(
                'Last Transactions',
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
                      reverse: true,
                      itemBuilder: (BuildContext context, index) =>
                          _buildListItem(
                              context, snapshot.data.documents[index]),
                    ),
                  );
                }),
            SizedBox(height: 100.0),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox.fromSize(
                        size: Size(60, 60), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Color(0xff43D098), // button color
                            child: InkWell(
                              splashColor: Color(0xff0F5757), // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.important_devices,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Providers",
                        style: TextStyle(fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox.fromSize(
                        size: Size(60, 60), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Color(0xff43D098), // button color
                            child: InkWell(
                              splashColor: Color(0xff0F5757), // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.history,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "History",
                        style: TextStyle(fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
