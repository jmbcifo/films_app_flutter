import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:films_app_flutter/models/user_model.dart';
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

  Future<bool> editUser({required UserModel userModel}) async {
    try {
      //Se puede hacer con un .set como el ejemplo anterior
      await _firestore.collection(_collection).doc(userModel.uid).update(
            userModel.toJson(),
          );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser({required String uidUser}) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(_collection).doc(uidUser).get();
      print(doc.data());

      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return UserModel(
        uid: '',
        email: '',
        urlImage: '',
      );
    }
  }

  Future<bool> deleteUser({required UserModel userModel}) async {
    try {
      await _firestore.collection(_collection).doc(userModel.uid).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
