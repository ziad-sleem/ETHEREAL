import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUsecase {
  final AuthRepo authRepoContract;

  RegisterUsecase({required this.authRepoContract});

  Future<BaseResponse<String>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,

  }) async {
    return await authRepoContract.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
