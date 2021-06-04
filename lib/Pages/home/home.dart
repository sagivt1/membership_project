import 'package:flutter/material.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:membership_project/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:membership_project/Pages/home/member_list.dart';
import 'package:membership_project/models/point.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

    DatabaseService(uid: _auth.getUsetId()).info;

    void _showInfoPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Text('Buttom sheet'),
        );
      });
    }

    return StreamProvider<List<Point>>.value(
      value: DatabaseService(uid: _auth.getUsetId()).member2,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: Text('Membership club'),
          backgroundColor: Colors.blue[800],
          elevation: 0.0,
          actions: <Widget> [
            TextButton.icon(
              icon: Icon(Icons.person,color: Colors.black,),
              label: Text('Profile',style: TextStyle(color: Colors.black),),
              onPressed: () => _showInfoPanel(),
            ),
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
