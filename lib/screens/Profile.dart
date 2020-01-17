import 'package:flutter/material.dart';
import 'package:idntfy_app/widgets/profileList.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

List<SettingItem> settingItems = [
  SettingItem(title: 'Account'),
  SettingItem(title: 'E-mail'),
  SettingItem(title: 'Notifications'),
];

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemCount: settingItems.length,
                  itemBuilder: (context, index) {
                    // final item = accountSettings[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(context,
                            './${settingItems[index].title.toLowerCase()}');
                      },
                      title: Text(settingItems[index].title),
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
