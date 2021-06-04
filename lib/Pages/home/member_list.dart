import 'package:flutter/material.dart';
import 'package:membership_project/models/point.dart';
import 'package:provider/provider.dart';
import 'package:membership_project/Pages/home/point_tile.dart';



class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {

    final points = Provider.of<List<Point>>(context);
    //print(points);


    points.forEach((point) {
      if(point != null) {
        print(point.store);
        print(point.point);
      }
    });

    return ListView.builder(
      itemCount: points.length,
        itemBuilder: (context, index) {
        return PointTile(point : points[index]);
    },
    );
  }
}
