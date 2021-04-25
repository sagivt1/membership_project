import 'package:flutter/material.dart';
import 'package:membership_project/Services/auth.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  //Text Field data
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('הרשמה'),
        backgroundColor: Colors.blue[800],
        //elevation: 0.0,
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          child: Column(
            children: <Widget> [
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text(
                  'הירשם',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          ),
        ),
      )
    );
  }
}



/*
Container(
padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
child: ElevatedButton(
child: Text('הירשם אנונימית'),
onPressed: () async {
dynamic result = _auth.registerAnon();
if(result == null){
print('שגיאה בהתחברות אנונימית');
}else{
print('הרשמה בוצעה בהצלחה');
print(result.userId);
}
},
),
),

 */