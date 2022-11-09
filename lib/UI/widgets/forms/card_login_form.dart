import 'package:films_app_flutter/UI/widgets/forms/text_form_field_widget.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class CardLoginForm extends StatelessWidget {
  const CardLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: Form(
          child: Column(
            children: [
              TextFormFieldWidget(
                obscureText: false,
                textEditingController: authController.nameController,
              ),
              TextFormFieldWidget(
                obscureText: true,
                textEditingController: authController.passwordController,
              ),
              FloatingActionButton(onPressed: () {
                print(authController.nameController.value.text);
              })
            ],
          ),
        ),
      ),
    );
  }
}
