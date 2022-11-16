import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageService {
  Future<String> uploadFileUser(
    File file,
    String uid,
  ) async {
    //Crear la referencia en firebase
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/$uid');

    //Transformar el path local en url y enviar el archivo
    await storageReference.putFile(file);

    //Obtener el url de Firebase
    return storageReference.getDownloadURL();
  }
}
