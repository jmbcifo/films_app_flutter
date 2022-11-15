import 'dart:io';

import 'package:films_app_flutter/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageService {
  Future<String> uploadFileUser(
    File file,
    UserModel userModel,
  ) async {
    //Crear la referencia en firebase
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/${userModel.uid}');

    //Transformar el path local en url
    await storageReference.putFile(file);

    //Obtener el url de Firebase
    return storageReference.getDownloadURL();
  }
}
