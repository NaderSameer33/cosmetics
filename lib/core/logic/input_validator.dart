class InputValidator {
  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'phone number must be required';
    } else if (value.length < 11) {
      return 'phone number must be 11 digit';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'password must be required';
    } else if (value.length < 11) {
      return 'password number must at least 11 digit';
    }
    return null;
  }
}
