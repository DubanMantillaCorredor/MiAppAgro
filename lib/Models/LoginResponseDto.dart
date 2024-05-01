class LoginResponseDto {
  late String email;
  late String token;
  late String fullname;

  LoginResponseDto({required this.email, required this.token, required this.fullname});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
        email: json['email'],
        token: json['token'],
        fullname: json['fullname']
    );
  }
}
