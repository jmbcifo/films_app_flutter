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
    firebase_storage.UploadTask uploadTask = storageReference.putFile(file);

    await uploadTask.whenComplete(() {
      //Obtener el url de Firebase
      storageReference.getDownloadURL().then((url) {
        print(url);

        return url;
      });
    });

    return '';
  }
}
