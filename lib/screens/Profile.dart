import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        child: ListView(),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffF3FCF5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('images/faces/face.png'),
                        maxRadius: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Hanna Simons',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        margin: EdgeInsets.only(bottom: 30.0),
                        decoration: BoxDecoration(
                          color: Color(0xff43D098), // Todo: Change Color
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Text(
                          'Verified',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('User Information'),
                    Text('Sharing'),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 4.0),
                      child: ListTile(
                        onTap: () {},
                        title: Text('Address'),
                        subtitle: Text('Placeholder'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            top: 55,
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () => scaffoldKey.currentState.openEndDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}
