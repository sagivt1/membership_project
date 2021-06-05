import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:membership_project/models/point.dart';
import 'package:membership_project/models/MemberInfo.dart';

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

  Future deleteUserDataById(String id) async {
    return await memberCollection.doc(id).delete().then((value) => null);
  }

  Future updateUserDataById(String store, int points, String id , String userId) async {

    return await memberCollection.doc(id).set({
      'id':userId,
      'store':store,
      'points':points
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
        id: doc.data()['id'] ?? '',
        store: doc.data()['store'] ?? '',
        point: doc.data()['points'] ?? 0,
        docId: doc.id ?? ""
      );
    }).toList();

  }

  List<Point> _pointListFromSnapshot2(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){
      if(doc.data()['id'] == uid) {
        return Point(
            id: doc.data()['id'] ?? '',
            store: doc.data()['store'] ?? '',
            point: doc.data()['points'] ?? 0,
            docId: doc.id ?? ""
        );
      }
    }).toList();
  }

  Future<MemberInfo> userInfoFromDocument() async {

    var val = await infoCollection.doc(uid).get();
    MemberInfo memberInfo = MemberInfo(firstName: val.data()['first_name'],lastName: val.data()['last_name']);

    return memberInfo;
  }

  Stream<MemberInfo> get userData{
    return infoCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  MemberInfo _userDataFromSnapshot(DocumentSnapshot snapshot){
    return MemberInfo(
      firstName: snapshot.data()['first_name'],
      lastName: snapshot.data()['last_name']
    );
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