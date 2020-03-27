import 'package:flutter/material.dart';
import 'package:idntfy_app/services/authentication.dart';
import 'package:idntfy_app/shared/classes/loading.dart';
import 'package:idntfy_app/shared/styles/form_fields.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
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
                  Text('Sign in', style: Theme.of(context).textTheme.subtitle),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70.0),
                      Image.asset('images/logo_authentication.png'),
                      SizedBox(height: 40.0),
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
                            'Sign in',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Could not sign in with those credentials';
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
            ),
          );
  }
}
