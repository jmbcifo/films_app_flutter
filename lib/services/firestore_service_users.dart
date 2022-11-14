import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabaseUsers {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String _collection = "USERS";

  Future<bool> createNewUser({
    required String uidUser,
    required String nameUser,
  }) async {
    try {
      await _firestore.collection(_collection).doc(uidUser).set({
        "uid": uidUser,
        "name": nameUser,
        "isAdmin": false,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
