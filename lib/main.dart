import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:membership_project/Pages/wrapper.dart';
import 'package:membership_project/Services/auth.dart';
import 'package:membership_project/models/member.dart';
import 'package:membership_project/Pages/menu_pages/edit_info.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//The root of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Member>.value(
      value: AuthService().member,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
