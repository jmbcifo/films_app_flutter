import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageUtils {
  void showPicker(
    BuildContext context, {
    required VoidCallback? onGalleryPressed,
    required VoidCallback? onCameraPressed,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Acceder a la galeria"),
                onTap: onGalleryPressed!,
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Acceder a la cámara"),
                onTap: onCameraPressed!,
              ),
            ],
          );
        });
  }

  Future<XFile?> imgFromGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    return image;
  }

  Future<XFile?> imgFromCamera() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    return image;
  }
}
