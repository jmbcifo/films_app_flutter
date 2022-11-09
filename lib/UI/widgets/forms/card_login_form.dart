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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              //POSIBLE ERROR
              //Es necesario utilizar los widget de Flutter como hijos del Form
              //Form => TextFormField , TextFormField ... etc => Validate
              //para hacer las validaciones => TextFormField
              TextFormField(
                obscureText: false,
                //textEditingController: authController.nameController,
                validator: formValidator.isValidName,
                onSaved: (value) {
                  authController.nameController.text = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: authController.passwordController,
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
