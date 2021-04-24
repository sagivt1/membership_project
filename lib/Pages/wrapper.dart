import 'package:flutter/material.dart';
import 'package:membership_project/Pages/authenticate/authenticate.dart';
import 'package:membership_project/Pages/home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either Home or Authenticate widget
    return Home();
  }
}
