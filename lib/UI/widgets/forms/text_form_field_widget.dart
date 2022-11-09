import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool obscureText;
  final TextEditingController textEditingController;
  const TextFormFieldWidget({
    Key? key,
    required this.obscureText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: textEditingController,
    );
  }
}
