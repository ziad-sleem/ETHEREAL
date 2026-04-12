// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/authentication/api/api_client/auth_api_client.dart'
    as _i326;
import '../../features/authentication/api/datasources/auth_local_data_source_impl.dart'
    as _i798;
import '../../features/authentication/api/datasources/auth_remote_data_source_impl.dart'
    as _i356;
import '../../features/authentication/data/datasources/auth_local_data_source_contract.dart'
    as _i741;
import '../../features/authentication/data/datasources/auth_remote_data_source_contract.dart'
    as _i793;
import '../../features/authentication/data/repositories/auth_repo_impl.dart'
    as _i836;
import '../../features/authentication/domain/repositories/auth_repo.dart'
    as _i802;
import '../../features/authentication/domain/usecases/forget_password_use_case.dart'
    as _i601;
import '../../features/authentication/domain/usecases/get_user_data_usecase.dart'
    as _i932;
import '../../features/authentication/domain/usecases/is_logged_in_use_case.dart'
    as _i162;
import '../../features/authentication/domain/usecases/login_usecase.dart'
    as _i995;
import '../../features/authentication/domain/usecases/logout_usecase.dart'
    as _i1067;
import '../../features/authentication/domain/usecases/register_usecase.dart'
    as _i257;
import '../../features/authentication/domain/usecases/verify_code_use_case.dart'
    as _i121;
import '../../features/authentication/presentation/cubit/auth_cubit.dart'
    as _i678;
import '../dio/dio_module.dart' as _i977;
import '../local/local_module.dart' as _i722;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final localModule = _$LocalModule();
    final dioModule = _$DioModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => localModule.secureStorage,
    );
    gh.factory<_i741.AuthLocalDataSourceContract>(
      () => _i798.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i741.AuthLocalDataSourceContract>()),
    );
    gh.factory<_i326.AuthApiClient>(() => _i326.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i793.AuthRemoteDataSourceContract>(
      () => _i356.AuthRemoteDataSourceImpl(
        authApiClient: gh<_i326.AuthApiClient>(),
        localDataSource: gh<_i741.AuthLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i802.AuthRepo>(
      () => _i836.AuthRepoImpl(
        authRemoteDataSourceContract: gh<_i793.AuthRemoteDataSourceContract>(),
        authLocalDataSourceContract: gh<_i741.AuthLocalDataSourceContract>(),
      ),
    );
    gh.lazySingleton<_i162.IsLoggedInUseCase>(
      () => _i162.IsLoggedInUseCase(gh<_i802.AuthRepo>()),
    );
    gh.factory<_i601.ForgetPasswordUseCase>(
      () => _i601.ForgetPasswordUseCase(gh<_i802.AuthRepo>()),
    );
    gh.factory<_i121.VerifyCodeUseCase>(
      () => _i121.VerifyCodeUseCase(gh<_i802.AuthRepo>()),
    );
    gh.factory<_i932.GetUserDataUsecase>(
      () => _i932.GetUserDataUsecase(authRepoContract: gh<_i802.AuthRepo>()),
    );
    gh.factory<_i995.LoginUsecase>(
      () => _i995.LoginUsecase(authRepoContract: gh<_i802.AuthRepo>()),
    );
    gh.factory<_i1067.LogoutUsecase>(
      () => _i1067.LogoutUsecase(authRepoContract: gh<_i802.AuthRepo>()),
    );
    gh.factory<_i257.RegisterUsecase>(
      () => _i257.RegisterUsecase(authRepoContract: gh<_i802.AuthRepo>()),
    );
    gh.lazySingleton<_i678.AuthCubit>(
      () => _i678.AuthCubit(
        loginUsecase: gh<_i995.LoginUsecase>(),
        registerUsecase: gh<_i257.RegisterUsecase>(),
        verifyCodeUseCase: gh<_i121.VerifyCodeUseCase>(),
        forgetPasswordUseCase: gh<_i601.ForgetPasswordUseCase>(),
        isLoggedInUseCase: gh<_i162.IsLoggedInUseCase>(),
        logoutUsecase: gh<_i1067.LogoutUsecase>(),
      ),
    );
    return this;
  }
}

class _$LocalModule extends _i722.LocalModule {}

class _$DioModule extends _i977.DioModule {}
