import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          return Expanded(
            child: ListView.separated(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // title: Text(snapshot.data.documents),
                  onTap: () {
                    print(snapshot.data.documents.toList()[index]);
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(
                thickness: 1,
              ),
            ),
          );
        });
  }
}
