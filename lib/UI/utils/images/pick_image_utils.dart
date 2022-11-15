import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      print(image.path);
    }
  }

  Future uploadFile() async {}
}
