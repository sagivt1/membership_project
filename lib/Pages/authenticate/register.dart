import 'package:flutter/material.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Shred/lodaing.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text Field data
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: Text('Sign Up'),
          backgroundColor: Colors.blue[800],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Please Enter email address' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val.length < 8
                        ? 'Password should contains at least 8 digit'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Invalid data';
                            loading = false;
                          });
                        }
                      }
                    },
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


