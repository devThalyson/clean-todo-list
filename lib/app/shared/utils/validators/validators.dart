class Validators {
  static String? emptyFieldValidator(String? value) {
    if (value!.isEmpty) {
      return 'Campo obrigatório!';
    }
  }
}
