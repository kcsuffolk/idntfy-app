import 'package:flutter/material.dart';
import 'package:idntfy_app/shared/constants.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  String currentAddress;
  String currentEmail;
  String currentPhoneNumber;
  String currentCreditCard;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Update your Personal Details',
              style: Theme.of(context).textTheme.subhead),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(labelText: 'Address'),
            validator: (val) => val.isEmpty ? 'Enter a valid address' : null,
            onChanged: (val) {
              setState(() => currentAddress = val);
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration:
                textInputDecoration.copyWith(labelText: 'E-Mail Address'),
            validator: (val) =>
                val.isEmpty ? 'Enter a valid e-mail address' : null,
            onChanged: (val) {
              setState(() => currentEmail = val);
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(labelText: 'Phone Number'),
            validator: (val) =>
                val.isEmpty ? 'Enter a valid phone number' : null,
            onChanged: (val) {
              setState(() => currentPhoneNumber = val);
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration:
                textInputDecoration.copyWith(labelText: 'Credit Card Number'),
            validator: (val) =>
                val.isEmpty ? 'Enter a valid credit card number' : null,
            onChanged: (val) {
              setState(() => currentPhoneNumber = val);
            },
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: 300.0,
            height: 55.0,
            child: FlatButton(
              color: Color(0xFF43D098),
              colorBrightness: Brightness.dark,
              child: Text(
                'Save',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
