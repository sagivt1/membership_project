import 'package:flutter/material.dart';
import 'package:membership_project/Services/auth.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  //Text Field data
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('התחברות'),
        backgroundColor: Colors.blue[800],
        //elevation: 0.0,
      ),
      body: Container(

      )
    );
  }
}
