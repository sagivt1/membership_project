import 'package:flutter/material.dart';
import 'package:membership_project/Pages/menu_pages/profile.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Pages/menu_pages/edit_info.dart';
import 'package:membership_project/Pages/home/home.dart';

class ShowPoints extends StatefulWidget {
  @override
  _ShowPointsState createState() => _ShowPointsState();
}

class _ShowPointsState extends State<ShowPoints> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()));
          }, //go back to home page
        ),
      ),
      body: Container(),
    );
  }
}
