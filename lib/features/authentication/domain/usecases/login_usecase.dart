import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final AuthRepo authRepoContract;

  LoginUsecase({required this.authRepoContract});

  Future<BaseResponse<String>> call({
    required String email,
    required String password,
  }) async {
    return await authRepoContract.login(email: email, password: password);
  }
}
