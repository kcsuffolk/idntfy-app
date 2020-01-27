import 'package:flutter/material.dart';

class ProviderAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Provider Access',
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
      body: Column(
        children: <Widget>[
          // ClipOval(
          //   child: Image.asset(
          // 'images/logos/${document['logo']}',
          // width: 85.0,
          //   ),
          // )
        ],
      ),
    );
  }
}
