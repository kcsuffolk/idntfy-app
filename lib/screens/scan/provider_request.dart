import 'package:flutter/material.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/screens/scan/provider_data_request.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:provider/provider.dart';

class ProviderRequest extends StatelessWidget {
  final String providerID;

  ProviderRequest({this.providerID});

  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<UserData>(context);
    final userData = Provider.of<UserData>(context);

    return StreamBuilder<ProviderData>(
        stream: DatabaseService(providerID: providerID).getProviderData,
        builder: (context, snapshot) {
          ProviderData providerData = snapshot.data;

          if (!snapshot.hasData) return Loading();

          return Scaffold(
            body: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 108.0),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('images/logos/${providerData.logo}'),
                    ),
                    radius: 35.0,
                  ),
                  SizedBox(height: 34.0),
                  Container(
                    width: 260.0,
                    child: Text(
                      providerData.company +
                          ' is asking you to share the following information',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: ProviderDataRequest(),
                  ),
                  Container(
                    width: 300.0,
                    height: 55.0,
                    child: FlatButton(
                      color: Color(0xFF43D098),
                      colorBrightness: Brightness.dark,
                      child: Text(
                        'Accept & Share',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        DatabaseService(
                                uid: userAuthStream.uid, providerID: providerID)
                            .updateUserProviderData(providerData.company,
                                providerData.domain, providerData.logo);
                        DatabaseService(
                                uid: userAuthStream.uid, providerID: providerID)
                            .updateUserProviderAccess(
                                providerID,
                                userData.name,
                                userData.email,
                                userData.address,
                                userData.phoneNumber);
                        Navigator.pushNamed(context, '/confirmation');
                        Future.delayed(Duration(milliseconds: 1500), () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/navigation', (Route<dynamic> route) => false);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        });
  }
}
