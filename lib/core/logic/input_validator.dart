class InputValidator {
  static String? userNameValdator(String ?value) {
    if (value!.isEmpty) {
      return 'User Name is Required';
    }
    return null;
  }
  static String? emailValitor(String ?value) {
    if (value!.isEmpty) {
      return ' Email is Required';
    } 
    return null;
  }

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
    } else if (value.length < 9) {
      return 'password number must at least 11 digit';
    }
    return null;
  }

}
