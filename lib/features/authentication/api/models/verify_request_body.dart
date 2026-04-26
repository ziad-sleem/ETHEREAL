class VerifyRequestBody {
  final String email;
  final String otp;

  VerifyRequestBody({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'otp': otp,
  };
}
