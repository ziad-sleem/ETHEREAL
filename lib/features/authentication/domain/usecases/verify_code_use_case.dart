import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
  final AuthRepo repository;

  VerifyCodeUseCase(this.repository);

  Future<BaseResponse<String>> call({required String email, required String otp}) {
    return repository.verifyCode(email: email, otp: otp);
  }
}
