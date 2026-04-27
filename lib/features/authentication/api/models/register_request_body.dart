class RegisterRequestBody {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  RegisterRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
  };
}
