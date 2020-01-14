import 'package:flutter/material.dart';
import 'package:idntfy_app/widgets/LatestTransactions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// Data from Database

List<LatestTransactions> lastTransaction = [
  LatestTransactions(
      provider: 'Facemag',
      datapoints: '9 datapoints shared',
      logo: 'facemag.png'),
  LatestTransactions(
      provider: 'Musify',
      datapoints: '2 datapoints shared',
      logo: 'musify.png'),
  LatestTransactions(
      provider: 'Twiffer',
      datapoints: '4 datapoints shared',
      logo: 'twiffer.png'),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latest Transactions',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: ListView.builder(
        itemCount: lastTransaction.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            // child: Card(
            child: ListTile(
              onTap: () {},
              title: Text(lastTransaction[index].provider),
              subtitle: Text(lastTransaction[index].datapoints),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('images/logos/${lastTransaction[index].logo}'),
              ),
            ),
            // ),
          );
        },
      ),
    );
  }
}
