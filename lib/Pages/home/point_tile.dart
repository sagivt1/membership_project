import 'package:flutter/material.dart';
import 'package:membership_project/Pages/home/barcode_remove.dart';
import 'package:membership_project/models/point.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


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
          onTap: () {
            print(point.docId);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QrCodeRemove(store : point.store,
                points: point.point,id: point.docId,userId: point.id,)),
            );
          },
        ),
      ),
    );
  }
}
