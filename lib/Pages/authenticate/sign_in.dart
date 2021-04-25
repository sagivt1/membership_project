import 'package:flutter/material.dart';
import 'package:membership_project/Services/auth.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Field data
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('התחברות'),
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
        actions: <Widget> [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('הרשמה'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget> [
              SizedBox(height: 20.0,),
              Text(
                'אימיל',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'אנא הכניסו כתובת אימייל' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              Text(
                'סיסמה',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 8 ? 'אנא הכניסו סיסמה בעל אורך הגדול מ 8' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text(
                  'התחבר',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() => error = 'המידע שהוכנס שגוי');
                    }
                  }
                },
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      )
    );
  }
}
