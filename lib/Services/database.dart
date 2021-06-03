import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference memberCollection = FirebaseFirestore.instance.collection('members');

  Future updateUserData(String store, int points) async {
     return await memberCollection.doc(uid).set({
       'store':store,
       'points':points
     });
  }

  Stream<QuerySnapshot> get member {
    return memberCollection.snapshots();
  }

}