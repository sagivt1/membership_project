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

  String _data = "",_temp;
  List<String> _list;

  _scan() async{
    _temp = await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", false, ScanMode.QR);
    _data = _temp;
    await _handelData();
  }
  Future _handelData() async {
    _list = _data.split("+");
    print('\x1B[33m$_list\x1B[0m');
    DatabaseService(uid: _auth.getUsetId()).updateUserData(_list[0], int.parse(_list[1]));
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
            Text(_data),
          ],
        ),
      ),
    );
  }
}
