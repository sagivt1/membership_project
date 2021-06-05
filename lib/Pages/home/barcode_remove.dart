import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Services/database.dart';






class QrCodeRemove extends StatefulWidget {

  final String store;
  final int points;
  final String id;
  final String userId;

  const QrCodeRemove ({ Key key, this.store ,this.points , this.id , this.userId}): super(key: key);

  @override
  _QrCodeRemoveState createState() => _QrCodeRemoveState();
}

class _QrCodeRemoveState extends State<QrCodeRemove> {

  final AuthService _auth = AuthService();

  String _data = "",_temp;
  List<String> _list;
  String ans = "";

  _scan() async{
    _temp = await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", false, ScanMode.QR);
    _data = _temp;
    await _handelData();
  }

  Future _handelData() async {
    _list = _data.split("-");
    print('\x1B[33m$_list\x1B[0m');
    if(_list[0] == widget.store) {
      if(int.parse(_list[1]) < widget.points){
        ans = "yes";
        DatabaseService().updateUserDataById(_list[0], widget.points - int.parse(_list[1]),widget.id, widget.userId);
      }
      else{
        if(int.parse(_list[1]) == widget.points) {
          ans = "yes";
          DatabaseService().deleteUserDataById(widget.id);
        }
        else{
          ans = "No1";
        }
      }
    }
    else{
      ans = "No2";
    }
    print('\x1B[33m$ans\x1B[0m');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  _scan();
                  Navigator.pop(context);
                },
                child: Text(
                  'Scan',
                  style: TextStyle(fontSize:50.0,color: Colors.black),
                )
            ),
            Text(ans),
          ],
        ),
      ),
    );
  }
}