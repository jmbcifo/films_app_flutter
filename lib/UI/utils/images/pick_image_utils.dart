import 'dart:io';
import 'package:films_app_flutter/models/user_model.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PickImageUtils {
  void showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Acceder a la galeria"),
                onTap: () async {
                  await imgFromGallery();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Acceder a la cámara"),
                onTap: () {},
              ),
            ],
          );
        });
  }

  Future imgFromGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    if (image != null) {
      print(image.path);
    }
    uploadFile(File(image!.path));
  }

  Future uploadFile(File file) async {
    //Crear la referencia en firebase
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/123456');

    //Transformar el path local en url
    firebase_storage.UploadTask uploadTask = storageReference.putFile(file);

    await uploadTask.whenComplete(() {
      //Obtener el url de Firebase
      storageReference.getDownloadURL().then((url) {
        print(url);
      });
    });
  }
}
