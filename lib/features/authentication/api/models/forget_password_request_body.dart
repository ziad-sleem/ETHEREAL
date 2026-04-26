class ForgetPasswordRequestBody {
  final String email;

  ForgetPasswordRequestBody({required this.email,});

  Map<String, dynamic> toJson() => {
    'email': email,
  };
}
