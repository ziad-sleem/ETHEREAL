import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/domain/entities/user_entity.dart';
import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUsecase {
  final AuthRepo authRepoContract;

  GetUserDataUsecase({required this.authRepoContract});

  Future<BaseResponse<UserEntity>> call() async {
    return await authRepoContract.getUserData();
  }
}
