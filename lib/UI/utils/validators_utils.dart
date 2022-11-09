class FormValidator {
  String? isValidName(String? text) {
    if (text == null || text.isEmpty || text.length < 3) {
      return "Este nombre NO es válido";
    }
    return null;
  }
}
