import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageUtils {
  void showPicker(BuildContext context, {required VoidCallback? onPressed}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Acceder a la galeria"),
                onTap: onPressed!,
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

  Future<XFile?> imgFromGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    return image;
  }
}
