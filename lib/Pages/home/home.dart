import 'package:flutter/material.dart';
import 'package:membership_project/Services/auth.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('Membership club'),
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
        actions: <Widget> [
          TextButton.icon(
            icon: Icon(Icons.logout,color: Colors.black,),
            label: Text('Logout',style: TextStyle(color: Colors.black),),
            onPressed: () async {
              await _auth.logOut();
            },
          )
        ],
      ),
    );
  }
}
