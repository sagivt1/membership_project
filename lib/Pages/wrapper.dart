import 'package:flutter/material.dart';
import 'package:membership_project/Pages/authenticate/authenticate.dart';
import 'package:membership_project/Pages/home/home.dart';
import 'package:membership_project/models/member.dart';
import 'package:provider/provider.dart';

///Check if user log in and direct to Home page
///else direct to Authenticate page for login or Register
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Member user = Provider.of<Member>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
