import 'package:films_app_flutter/UI/utils/images/pick_image_utils.dart';
import 'package:films_app_flutter/UI/utils/validators_utils.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditUserPage extends StatelessWidget {
  EditUserPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    FormValidator formValidator = FormValidator();
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
                    onGalleryPressed: () async {
                      XFile? result = await PickImageUtils().imgFromGallery();
                      File file = File(result!.path);
                      await authController.changePhotoUser(file);

                      Get.back();
                    },
                    onCameraPressed: () async {
                      XFile? result = await PickImageUtils().imgFromCamera();
                      File file = File(result!.path);
                      await authController.changePhotoUser(file);

                      Get.back();
                    },
                  );
                },
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        radius: 40,
                        child: Image.network(
                          authController.userDb.value?.urlImage ??
                              "https://picsum.photos/250?image=9",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 200,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextFormField(
                          obscureText: false,
                          controller: authController.nameController,
                          validator: formValidator.isValidName,
                          decoration: InputDecoration(
                              hintText: authController.userDb.value?.name ??
                                  "Escribe tu nombre"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            authController.userDb.value!.name =
                                authController.nameController.value.text;
                            print(authController.userDb.value!.name);
                            Get.back();
                            bool response = await authController.changeUser();
                            if (response == true) {
                              print("TODO OK!");
                              authController.nameController.clear();
                            }

                            print("Este formulario es verdadero");
                          } else {
                            Get.back();
                            print("vuelve a intentarlo");
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          color: Colors.pink,
                          child: const Center(
                            child: Text(
                              "EDITAR USUARIO",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
