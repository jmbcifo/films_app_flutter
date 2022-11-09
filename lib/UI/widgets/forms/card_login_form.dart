import 'package:films_app_flutter/UI/utils/validators_utils.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class CardLoginForm extends StatelessWidget {
  CardLoginForm({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    FormValidator formValidator = FormValidator();
    return Form(
      key: _formKey,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //POSIBLE ERROR
              //Es necesario utilizar los widget de Flutter como hijos del Form
              //Form => TextFormField , TextFormField ... etc => Validate
              //para hacer las validaciones => TextFormField
              Flexible(
                child: TextFormField(
                  obscureText: false,
                  controller: authController.nameController,
                  validator: formValidator.isValidName,
                  decoration: InputDecoration(hintText: "Escribe tu nombre"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextFormField(
                  obscureText: false,
                  controller: authController.emailController,
                  validator: formValidator.isValidEmail,
                  decoration: InputDecoration(hintText: "Escribe tu email"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextFormField(
                  obscureText: true,
                  controller: authController.passwordController,
                  validator: formValidator.isValidPass,
                  decoration:
                      InputDecoration(hintText: "Escribe tu contraseña"),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),

              TextButton(
                onPressed: () {
                  print(authController.nameController.value);
                  if (_formKey.currentState!.validate()) {
                    print("Este formulario es verdadero");
                  } else {
                    print("vuelve a intentarlo");
                  }
                },
                child: Container(
                  height: 30,
                  width: 100,
                  color: Colors.pink,
                  child: const Center(
                    child: Text(
                      "LOGIN",
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
    );
  }
}
