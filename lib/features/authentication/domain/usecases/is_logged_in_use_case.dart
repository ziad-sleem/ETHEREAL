import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IsLoggedInUseCase {
  final AuthRepo _authRepo;

  IsLoggedInUseCase(this._authRepo);

  Future<bool> call() async {
    return await _authRepo.isLoggedIn();
  }
}
