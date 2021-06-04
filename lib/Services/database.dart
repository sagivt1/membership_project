import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:membership_project/models/point.dart';
import 'package:membership_project/models/user_info.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  CollectionReference memberCollection = FirebaseFirestore.instance.collection('members');
  CollectionReference infoCollection = FirebaseFirestore.instance.collection('Users Info');

  Future updateUserInfoData(String firstName, String lastName) async {
    return await infoCollection.doc(uid).set({
      'first_name':firstName,
      'last_name':lastName
    });
  }

  Future updateUserData(String store, int points) async {
     return await memberCollection.doc().set({
       'id':uid,
       'store':store,
       'points':points
     });
  }



  List<Point> _pointListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){
      return Point(
        store: doc.data()['store'] ?? '',
        point: doc.data()['points'] ?? 0
      );
    }).toList();

  }

  List<Point> _pointListFromSnapshot2(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){
      print(doc.data());
      if(doc.id == uid) {
        return Point(
            store: doc.data()['store'] ?? '',
            point: doc.data()['points'] ?? 0
        );
      }
    }).toList();


  }

  UserInfo _userInfoFromDocument(QuerySnapshot snapshot) {
    UserInfo userInfo;
    snapshot.docs.map((doc) {
      if(doc.id == uid){
        userInfo = UserInfo(
          firstName: doc.data()['first_name'],
          lastName: doc.data()['last_name'],
        );
      }
    });

    print(userInfo);
    return userInfo;

  }

  Stream<UserInfo> get info {
    return infoCollection.snapshots()
        .map(_userInfoFromDocument);
  }


  Stream<List<Point>> get member2 {

    return memberCollection.snapshots()
        .map(_pointListFromSnapshot2);
  }

  Stream<List<Point>> get member {
    return memberCollection.snapshots()
      .map(_pointListFromSnapshot);
  }

}