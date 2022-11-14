import 'package:films_app_flutter/UI/pages/auth/login_page.dart';
import 'package:films_app_flutter/UI/routes/app_routes.dart';
import 'package:films_app_flutter/services/auth_firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  Rxn<User?> firebaseUser = Rxn<User?>();
  RxBool checkTerms = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get user => _auth.authStateChanges();

  @override
  void onReady() {
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(user);
    super.onReady();
  }

  signInAnonymous() async {
    firebaseUser.value = await AuthFirebaseRepository().signInAnonymous();
    print(firebaseUser.value?.isAnonymous ?? '');
  }

  registerWithEmailAndPassword() async {
    firebaseUser.value =
        await AuthFirebaseRepository().registerWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );
  }

  loginWithEmailAndPassword() async {
    firebaseUser.value =
        await AuthFirebaseRepository().loginWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  handleAuthChanged(User? firebaseUser) async {
    //Conseguir datos desde firestore

    if (firebaseUser?.isAnonymous == false && firebaseUser?.uid != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
