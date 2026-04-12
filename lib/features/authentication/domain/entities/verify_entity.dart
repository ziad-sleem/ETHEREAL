class VerifyEntity {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;

  VerifyEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });
}