class EndPoints {
  EndPoints._();

  // Base URL:
  static const String baseUrl = "https://exam.elevateegy.com/api/v1";

  // API EndPoints:
  static const String signin = "$baseUrl/auth/signin";

  static const String forgetPassword = "/auth/forgotPassword";
  static const String verifyResetCode = "/auth/verifyResetCode";
  static const String resetPassword = "/auth/resetPassword";
  static const String register = "$baseUrl/auth/signup";

  static const String logout = "$baseUrl/auth/logout";

  static const String profileData = "$baseUrl/auth/profileData";
  static const String subjects = "$baseUrl/subjects";
  static const String exams = "$baseUrl/exams";

  static const String getQuestions = "$baseUrl/questions";

  static const String checkQuestions = "$baseUrl/questions/check";
}
