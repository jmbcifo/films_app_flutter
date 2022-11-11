import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseRepository {
  Future<User?> signInAnonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print(userCredential.credential);
      print("Signed in with temporary account.");
      User? user = userCredential.user;
      print(user!.isAnonymous);
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }

      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }

      return null;
    }
  }
}
