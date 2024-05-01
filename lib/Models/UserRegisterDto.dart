class UserRegisterDto {
  late UserCredentialDto user;

  UserRegisterDto(String emailText, String passwordText){
    user = UserCredentialDto(emailText: emailText, passwordText: passwordText);
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
    };
  }
}

class UserCredentialDto{
  late String email;
  late String password;

  UserCredentialDto({required String emailText, required String passwordText}){
    this.email = emailText;
    this.password = passwordText;
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
    };
  }
}