import 'package:firebase_auth/firebase_auth.dart';
import 'package:membership_project/Services/database.dart';
import 'package:membership_project/models/member.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get user from the database and return as Member object
  Member _userFromFirebaseUser(User user) {
    return user != null ? Member(userId: user.uid) : null;
  }

  /// auth change user stream
  Stream<Member> get member {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  ///Anonymous Sign In
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///Sign out
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('store1', 20);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
