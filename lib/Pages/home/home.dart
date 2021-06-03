import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:membership_project/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:membership_project/Pages/home/member_list.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().member,
      initialData: null,
      child: Scaffold(
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
        body: MemberList(),
      ),
    );
  }
}
