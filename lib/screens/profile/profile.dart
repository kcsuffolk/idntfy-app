import 'package:flutter/material.dart';
import 'package:idntfy_app/widgets/profileList.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = User(
          // user data provided by database
          address: 'Blockchain Street 135',
          email: 'test@gmail.com',
          phoneNumber: '041 123 45 60',
          creditCardNumber: '1234 5678 9162 2345')
      .toMap();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.verified_user,
                            color: Color(0xff43D098),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Verified',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print(user.keys.toList()[index]);
                        Navigator.pushNamed(context,
                            './${user.keys.toList()[index].toLowerCase().replaceAll(' ', '')}');
                      },
                      title: Text(user.keys.toList()[index]),
                      subtitle: Text(user.values.toList()[index]),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  },
                  separatorBuilder: (BuildContext context, index) => Divider(
                    thickness: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
