import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';



class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {

    final points = Provider.of<QuerySnapshot>(context);
    //print(points.docs);

    for(var doc in points.docs){
      print(doc.data());
    }

    return Container(

    );
  }
}
