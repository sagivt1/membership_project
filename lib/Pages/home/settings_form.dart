import 'package:flutter/material.dart';
import 'package:membership_project/Shred/constants.dart';
import 'package:membership_project/Shred/lodaing.dart';
import 'package:membership_project/models/MemberInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:membership_project/models/member.dart';


class SettingForm extends StatefulWidget {


  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {


  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  final AuthService _auth = AuthService();

  String _currentFirstName;
  String _currentLastName;



  @override
  Widget build(BuildContext context) {

    final Member user = Provider.of<Member>(context);
    
    return StreamBuilder<MemberInfo>(
      stream: DatabaseService(uid: user.userId).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          MemberInfo memberInfo = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('Personal Information',
                  style: TextStyle(fontSize: 18.0),),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration,
                    initialValue: memberInfo.firstName,
                    validator: (val) => val.isEmpty ? 'Enter First Name' : null ,
                    onChanged: (val) {
                      setState(() {
                        _currentFirstName = val;
                      });
                    }
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                    decoration: textInputDecoration,
                    initialValue: memberInfo.lastName,
                    validator: (val) => val.isEmpty ? 'Enter Last Name' : null ,
                    onChanged: (val) {
                      setState(() {
                        _currentLastName = val;
                      });
                    }
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.userId).updateUserInfoData(
                          _currentFirstName ?? memberInfo.firstName,
                          _currentLastName ?? memberInfo.lastName
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Update',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        }
        else{
          return Loading();
        }
      }
    );
  }
}
