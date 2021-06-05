import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Services/database.dart';






class QrCodeRemove extends StatefulWidget {

  final String store;
  final int points;
  final String id;

  const QrCodeRemove ({ Key key, this.store ,this.points , this.id}): super(key: key);

  @override
  _QrCodeRemoveState createState() => _QrCodeRemoveState();
}

class _QrCodeRemoveState extends State<QrCodeRemove> {


  final AuthService _auth = AuthService();

  String _data = "";
  List<String> _list;
  String ans = "";

  _scan() async{
    await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", false, ScanMode.QR)
        .then((value) => setState(() => _data = value));
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
                  _list = _data.split("-");
                  if(_list[0] == widget.store) {
                    ans = "Yes";
                  }
                  else{
                    ans = "No";
                  }
                  //Navigator.pop(context);
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