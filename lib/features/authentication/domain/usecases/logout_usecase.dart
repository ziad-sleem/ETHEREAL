import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUsecase {
  final AuthRepo authRepoContract;

  LogoutUsecase({required this.authRepoContract});

  Future<BaseResponse<void>> call() async {
    return await authRepoContract.logout();
  }
}
