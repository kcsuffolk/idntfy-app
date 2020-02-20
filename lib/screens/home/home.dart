import 'package:flutter/material.dart';
import 'package:idntfy_app/screens/home/activity_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.important_devices),
            onPressed: () {
              Navigator.pushNamed(context, '/providers');
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
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ActivityList(),
          ),
        ],
      ),
    );
  }
}
