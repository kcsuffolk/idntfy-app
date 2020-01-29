import 'package:flutter/material.dart';
import 'package:idntfy_app/services/authentication.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:idntfy_app/shared/styles/constants.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String name = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title:
                  Text('Sign up', style: Theme.of(context).textTheme.subtitle),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Name'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter a valid email address' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Password'),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'Password must have at least 6 characters'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
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
                          'Register',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    name, email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'Please check your input';
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
