import 'package:films_app_flutter/UI/themes/colors_theme.dart';
import 'package:films_app_flutter/UI/utils/validators_utils.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardRegisterForm extends StatelessWidget {
  CardRegisterForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    FormValidator formValidator = FormValidator();
    return Form(
      key: _formKey,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              //POSIBLE ERROR
              //Es necesario utilizar los widget de Flutter como hijos del Form
              //Form => TextFormField , TextFormField ... etc => Validate
              //para hacer las validaciones => TextFormField
              Flexible(
                child: TextFormField(
                  obscureText: false,
                  controller: authController.nameController,
                  validator: formValidator.isValidName,
                  decoration:
                      const InputDecoration(hintText: "Escribe tu nombre"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextFormField(
                  obscureText: false,
                  controller: authController.emailController,
                  validator: formValidator.isValidEmail,
                  decoration:
                      const InputDecoration(hintText: "Escribe tu email"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextFormField(
                  obscureText: true,
                  controller: authController.passwordController,
                  validator: formValidator.isValidPass,
                  decoration:
                      const InputDecoration(hintText: "Escribe tu contraseña"),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextFormField(
                  obscureText: true,
                  controller: authController.repeatPasswordController,
                  validator: formValidator.isValidPass,
                  decoration: const InputDecoration(
                    hintText: "Repite tu contraseña",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                    AppColors().getColorCheckBox,
                  ),
                  value: authController.checkTerms.value,
                  onChanged: (bool? value) {
                    authController.checkTerms.value = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (contex) {
                          return AlertDialog(
                            title: Text("Este formulario es correcto"),
                          );
                        });
                    if (authController.passwordController.text ==
                        authController.repeatPasswordController.text) {
                      print("Ambas contraseñas son iguales");
                      if (authController.checkTerms.value == true) {
                        authController.registerWithEmailAndPassword();
                      } else {}
                    } else {
                      print("Las contraseñas no son iguales");
                    }
                  } else {
                    print("vuelve a intentarlo");
                  }
                },
                child: Container(
                  height: 30,
                  width: 120,
                  color: Colors.pink,
                  child: const Center(
                    child: Text(
                      "REGISTRARSE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
