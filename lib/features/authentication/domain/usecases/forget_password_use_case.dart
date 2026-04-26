import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepo repository;

  ForgetPasswordUseCase(this.repository);

  Future<BaseResponse<String>> call(String email) {
    return repository.forgetPassword(email);
  }
} 
