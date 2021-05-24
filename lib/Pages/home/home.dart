import 'dart:io';
import 'package:flutter/material.dart';
import 'package:membership_project/Pages/menu_pages/profile.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Pages/menu_pages/edit_info.dart';
import 'package:membership_project/Pages/menu_pages/add_points.dart';
import 'package:image_picker/image_picker.dart';
import 'package:membership_project/Pages/menu_pages/show_my_points.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:membership_project/Pages/home/home.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool showPassword = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('Membership club'),
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () async {
              await _auth.logOut();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Be On Point',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Show My Points'),
              leading: Icon(Icons.add_shopping_cart_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          ShowPoints() //change to the page when we will create it
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Use My Points'),
              leading: Icon(Icons.add_shopping_cart_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          Edit() //change to the page when we will create it
                      ),
                );
              },
            ),
            ListTile(
              title: Text('Add Points'),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPoints()),
                );
              },
            ),
            ListTile(
              title: Text('Edit Information'),
              leading: Icon(Icons.account_circle_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edit()),
                );
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              leading: Icon(Icons.email),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          Edit() //change to the page when we will create it
                      ),
                );
              },
            ),
          ],
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
              imageProfile(),
              SizedBox(
                height: 20,
              ),
              buildTextField('Full Name', 'Amit Bracha', false),
              buildTextField('Password', '******', true),
              buildTextField('Email', 'amit@gmail.com', false),
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
          padding: const EdgeInsets.only(bottom: 35, top: 20),
          child: SizedBox(
            width: 330,
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
                    color: Colors.black,
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
      ],
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundImage: _imageFile == null
                ? AssetImage("assets/DefaultProfilePicture.png")
                : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.edit_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget bottomSheet() {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Picture",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource pic) async {
    //maybe change void to Future
    final pickedFile = await _picker.getImage(
      source: pic,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
