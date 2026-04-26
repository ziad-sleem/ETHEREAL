class EndPoints {
  EndPoints._();

  // Base URL:
  static const String baseUrl = "https://accessories-eshop.runasp.net/api/";
  
  // API EndPoints:
  static const String login = "auth/login";
  static const String forgetPassword = "auth/forgot-password";
  static const String register = "auth/register";
  static const String verifyOTP = "auth/verify-email";
  static const String logout = "auth/logout";
  static const String profileData = "auth/me";

  static const String products = "products";
  static const String categories = "categories";
  static const String categoryById = "categories/{id}";
}
