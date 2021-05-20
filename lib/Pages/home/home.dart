import 'package:flutter/material.dart';
import 'package:membership_project/Pages/menu_pages/profile.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/Pages/menu_pages/edit_info.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
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
              title: Text('Profile'),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
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
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          //BottomNavigationBarItem(
          //  title: Text("Profile"),
          //  icon: Icon(Icons.account_circle),
          //),
          //Action()
        ],
      ),
    );
  }
}
