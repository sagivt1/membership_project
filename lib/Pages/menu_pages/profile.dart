import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:membership_project/Pages/home/home.dart';

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
      body: Container(
        padding: EdgeInsets.only(left: 8, top: 8),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Profile',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              imageProfile(context),

              SizedBox(
                height: 50,
              ),
              buildTextField('Full Name', 'Amit Bracha', false),
              buildTextField('Password', '******', true),
              buildTextField('Email', 'amit@gmail.com', false),
              SizedBox(
                height: 190,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: deprecated_member_use
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      // ignore: deprecated_member_use
                      child: OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2.5,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 5,
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

Widget imageProfile(context) {
  return Center(
    child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage("assets/DefaultProfilePicture.png"),
        ),
      ],
    ),
  );

  /**
  return Center(
    child: Stack(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(
                width: 4,
                color: Theme.of(context).scaffoldBackgroundColor),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 10),
              )
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 4,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              color: Colors.blue,
            ),
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
  **/
}