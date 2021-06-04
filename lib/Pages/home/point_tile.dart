import 'package:flutter/material.dart';
import 'package:membership_project/models/point.dart';


class PointTile extends StatelessWidget {

  final Point point;

  PointTile({ this.point });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue[1000],
          ),
          title: Text(point.store),
          subtitle: Text(point.point.toString()),
        ),
      ),
    );
  }
}
