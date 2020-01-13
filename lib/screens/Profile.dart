import 'package:flutter/material.dart';
import 'package:idntfy_app/widgets/UserProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

List<UserProfile> userProfile = [];

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      // body: ListView.builder(),
    );
  }
}
