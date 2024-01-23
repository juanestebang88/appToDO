class ValidationsForm {

  static String? email(String email) {
    if (email.isEmpty) {
      return 'El correo no puede estar vacío';
    }
    if(!emailPattern.hasMatch(email)){
      return 'No es un correo válido';
    }
    return null;
  }

  static String? password(String password) {
    if (password.isEmpty) {
      return 'La contraseña no puede estar vacío';
    }
    if(password.length != 6){
      return 'La contraseña debe ser de 6 dígitos';
    }
    if(!onlyNumbersPattern.hasMatch(password)){
      return 'La contraseña solo debe contener números';
    }
    return null;
  }

  static String? passwordConfirm(String password1, String password2) {
    if(password1 != password2){
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  static String? name(String name) {
    if (name.isEmpty) {
      return 'El name no puede estar vacío';
    }
    if(!onlyLettersAndSpacesPattern.hasMatch(name)){
      return 'El nombre solo debe contener letras';
    }
    if(name.length < 4){
      return 'El nombre debe tener mas caracteres';
    }
    return null;
  }

  static String? nameTask(String nameTask) {
    if (nameTask.isEmpty) {
      return 'El nombre de la tarea no puede estar vacío';
    }
    if(!onlyLettersAndSpacesPattern.hasMatch(nameTask)){
      return 'El nombre de la tarea solo debe contener letras';
    }
    if(nameTask.length < 6){
      return 'El nombre de la tarea debe tener mas caracteres';
    }
    return null;
  }

  //RegExp
  static final emailPattern = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final onlyNumbersPattern = RegExp(r'^[0-9]+$');
  static final onlyLettersAndSpacesPattern = RegExp(r'^[a-zA-Z\s]+$');

}