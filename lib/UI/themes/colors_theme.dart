import 'package:flutter/material.dart';

class AppColors {
  Color getColorCheckBox(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  static const Color darkBackground = Color.fromARGB(255, 39, 48, 65);
}
