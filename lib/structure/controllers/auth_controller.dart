import 'dart:io';
import 'dart:math';

import 'package:films_app_flutter/UI/pages/auth/login_page.dart';
import 'package:films_app_flutter/UI/routes/app_routes.dart';
import 'package:films_app_flutter/models/user_model.dart';
import 'package:films_app_flutter/services/auth_firebase_repository.dart';
import 'package:films_app_flutter/services/firebase_storage_service.dart';
import 'package:films_app_flutter/services/firestore_service_users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  Rxn<UserModel> userDb = Rxn<UserModel>();

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
  }

  Future<bool> editUser(UserModel userModel) async {
    bool response =
        await FirestoreDatabaseUsers().editUser(userModel: userModel);
    userDb.value = userModel;
    return response;
  }

  registerWithEmailAndPassword() async {
    firebaseUser.value =
        await AuthFirebaseRepository().registerWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    FirestoreDatabaseUsers().createNewUser(
      uidUser: firebaseUser.value!.uid,
      nameUser: emailController.value.text,
    );
  }

  loginWithEmailAndPassword() async {
    firebaseUser.value =
        await AuthFirebaseRepository().loginWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    userDb.value = await FirestoreDatabaseUsers()
        .getUser(uidUser: firebaseUser.value!.uid);
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  handleAuthChanged(User? firebaseUser) async {
    //Conseguir datos desde firestore

    if (firebaseUser?.isAnonymous == false && firebaseUser?.uid != null) {
      userDb.value =
          await FirestoreDatabaseUsers().getUser(uidUser: firebaseUser!.uid);
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  changePhotoUser(File file) async {
    String url =
        await FirebaseStorageService().uploadFileUser(file, userDb.value!.uid);
    userDb.value = UserModel(
      uid: userDb.value!.uid,
      email: userDb.value!.email,
      urlImage: url,
      isAdmin: userDb.value!.isAdmin,
    );
  }
}
