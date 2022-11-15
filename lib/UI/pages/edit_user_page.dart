import 'package:films_app_flutter/UI/utils/images/pick_image_utils.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditUserPage extends StatelessWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Editar usuario",
          ),
        ),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: GestureDetector(
                onTap: () {
                  PickImageUtils().showPicker(
                    context,
                    onPressed: () async {
                      XFile? result = await PickImageUtils().imgFromGallery();
                      File file = File(result!.path);
                      authController.changePhotoUser(file);

                      Get.back();
                    },
                  );
                },
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        child: Image.network(
                            authController.userDb.value?.urlImage ??
                                "https://picsum.photos/250?image=9"),
                        radius: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
