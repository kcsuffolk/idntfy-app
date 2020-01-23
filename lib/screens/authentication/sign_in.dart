import 'package:flutter/material.dart';
import 'package:idntfy_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign in', style: Theme.of(context).textTheme.subtitle),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(0xFF3F4441),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF43D098), width: 2.0),
                  ),
                ),
                validator: (val) =>
                    val.isEmpty ? 'Enter a valid email address' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF3F4441),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF43D098), width: 2.0),
                  ),
                ),
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
                    'Sign in',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      Navigator.pop(context);
                      if (result == null) {
                        setState(() =>
                            error = 'Could not sign in with those credentials');
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
