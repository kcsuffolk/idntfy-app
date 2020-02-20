import 'package:flutter/material.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/services/database.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:idntfy_app/shared/styles/form_fields.dart';
import 'package:provider/provider.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();
  String _currentAddress;
  String _currentEmail;
  String _currentPhoneNumber;
  // String _currentCreditCard;

  @override
  Widget build(BuildContext context) {
    final userAuthStream = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: userAuthStream.uid).getUserDocuments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                  title: Text('Account Settings',
                      style: Theme.of(context).textTheme.subtitle)),
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 70.0),
                        TextFormField(
                          initialValue: userData.address,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Address'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Address' : null,
                          onChanged: (val) {
                            setState(() => _currentAddress = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          initialValue: userData.email,
                          decoration:
                              textInputDecoration.copyWith(labelText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Email Address' : null,
                          onChanged: (val) {
                            setState(() => _currentEmail = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          initialValue: userData.phoneNumber,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Phone Number'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Phone Number' : null,
                          onChanged: (val) {
                            setState(() => _currentPhoneNumber = val);
                          },
                        ),
                        // SizedBox(height: 20.0),
                        // TextFormField(
                        //   decoration: textInputDecoration.copyWith(labelText: 'Address'),
                        //   validator: (val) => val.isEmpty ? 'Enter your Addres' : null,
                        //   onChanged: (val) {
                        //     setState(() => _currentAddress = val);
                        //   },
                        // ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: 300.0,
                          height: 55.0,
                          child: FlatButton(
                            color: Color(0xFF43D098),
                            colorBrightness: Brightness.dark,
                            child: Text(
                              'Save changes',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await DatabaseService(uid: userAuthStream.uid)
                                    .updateUserData(
                                        userData.name,
                                        _currentEmail ?? userData.email,
                                        _currentAddress ?? userData.address,
                                        _currentPhoneNumber ??
                                            userData.phoneNumber);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
