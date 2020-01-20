import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, index) =>
                          _buildListItem(
                              context, snapshot.data.documents[index]),
                      separatorBuilder: (BuildContext context, index) =>
                          Divider(
                        thickness: 1,
                      ),
                    ),
                  );
                }),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox.fromSize(
                        size: Size(60, 60), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Color(0xff43D098), // button color
                            child: InkWell(
                              splashColor: Color(0xff0F5757), // splash color
                              onTap: () {
                                Navigator.pushNamed(context, './providers');
                              }, // button pressed
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
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16.0),
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
