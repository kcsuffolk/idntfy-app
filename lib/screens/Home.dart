import 'package:flutter/material.dart';
import 'package:idntfy_app/widgets/LatestTransactions.dart';
import 'package:idntfy_app/presentation/custom_icons_icons.dart';

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
      // appBar: AppBar(
      //   title: Text(
      //     'Latest Transactions',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontFamily: 'Poppins',
      //       fontWeight: FontWeight.bold,
      //       fontSize: 24,
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   brightness: Brightness.light,
      // ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                IconButton(
                  icon: Icon(CustomIcons.grid),
                  iconSize: 18.0,
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: Icon(CustomIcons.search),
                    iconSize: 18.0,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Latest Transactions',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lastTransaction.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    // child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(lastTransaction[index].provider),
                      subtitle: Text(lastTransaction[index].datapoints),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'images/logos/${lastTransaction[index].logo}'),
                      ),
                    ),
                    // ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
