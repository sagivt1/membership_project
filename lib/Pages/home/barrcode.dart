import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Services/database.dart';



class QrCode extends StatefulWidget {

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {


  final AuthService _auth = AuthService();

  String _data = "";
  List<String> _list;

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
                  _list = _data.split("+");
                  DatabaseService(uid: _auth.getUsetId()).updateUserData(_list[0], int.parse(_list[1]));
                  Navigator.pop(context);
                  },
                child: Text(
                  'Scan',
                  style: TextStyle(fontSize:50.0,color: Colors.black),
                )
            ),
            Text(_data),
          ],
        ),
      ),
    );
  }
}
