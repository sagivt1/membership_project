import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:membership_project/Pages/authenticate/authenticate.dart';
import 'package:membership_project/Pages/home/home.dart';
import 'package:membership_project/models/member.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile UI",
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          }, //go back to home page
        ),
      ),
      body: Container(),
    );
  }

  Widget buildTextField(String lText, String textHolder, bool isPassword) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 35),
          child: SizedBox(
            width: 270,
            child: TextField(
              obscureText: isPassword ? showPassword : false,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.green,
                        ),
                      )
                    : null,
                contentPadding: EdgeInsets.only(bottom: 5),
                labelText: lText,
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: textHolder,
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 25),
            elevation: 5,
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              'Update',
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2.5,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
