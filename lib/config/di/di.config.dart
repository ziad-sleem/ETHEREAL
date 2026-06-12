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

import '../../core/api/api_client/products_api_client.dart' as _i881;
import '../../core/api/datasources/products_remote_data_source_impl.dart'
    as _i675;
import '../../core/data/datasources/products_remote_data_source_contract.dart'
    as _i651;
import '../../core/data/repositories/products_repo_impl.dart' as _i715;
import '../../core/domain/repos/products_repo.dart' as _i836;
import '../../core/domain/usecases/get_all_products_use_case.dart' as _i171;
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
import '../../features/cart/api/api_client/cart_api_client.dart' as _i673;
import '../../features/cart/api/datasources/cart_remote_data_source_impl.dart'
    as _i210;
import '../../features/cart/data/datasources/cart_remote_data_source_contract.dart'
    as _i258;
import '../../features/cart/data/repositories/cart_repo_impl.dart' as _i938;
import '../../features/cart/domain/repositories/cart_repo.dart' as _i184;
import '../../features/cart/domain/usecases/add_to_cart_use_case.dart' as _i625;
import '../../features/cart/domain/usecases/delete_from_cart_use_case.dart'
    as _i989;
import '../../features/cart/domain/usecases/get_cart_use_case.dart' as _i488;
import '../../features/cart/presentation/cubit/cart_cubit.dart' as _i499;
import '../../features/home/api/api_client/home_api_client.dart' as _i592;
import '../../features/home/api/datasources/home_remote_data_source_impl.dart'
    as _i796;
import '../../features/home/data/datasources/home_remote_data_source_contract.dart'
    as _i969;
import '../../features/home/data/repositories/home_repo_impl.dart' as _i333;
import '../../features/home/domain/repos/home_repo.dart' as _i130;
import '../../features/home/domain/usecases/get_all_categories_use_case.dart'
    as _i87;
import '../../features/home/domain/usecases/get_category_by_id_use_case.dart'
    as _i437;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i552;
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
    gh.factory<_i881.ProductsApiClient>(
      () => _i881.ProductsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i326.AuthApiClient>(() => _i326.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i673.CartApiClient>(() => _i673.CartApiClient(gh<_i361.Dio>()));
    gh.factory<_i592.HomeApiClient>(() => _i592.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i793.AuthRemoteDataSourceContract>(
      () => _i356.AuthRemoteDataSourceImpl(
        authApiClient: gh<_i326.AuthApiClient>(),
        localDataSource: gh<_i741.AuthLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i258.CartRemoteDataSourceContract>(
      () => _i210.CartRemoteDataSourceImpl(gh<_i673.CartApiClient>()),
    );
    gh.factory<_i651.ProductsRemoteDataSourceContract>(
      () => _i675.ProductsRemoteDataSourceImpl(
        productsApiClient: gh<_i881.ProductsApiClient>(),
      ),
    );
    gh.factory<_i836.ProductsRepo>(
      () => _i715.ProductsRepoImpl(
        productsRemoteDataSourceContract:
            gh<_i651.ProductsRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i802.AuthRepo>(
      () => _i836.AuthRepoImpl(
        authRemoteDataSourceContract: gh<_i793.AuthRemoteDataSourceContract>(),
        authLocalDataSourceContract: gh<_i741.AuthLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i969.HomeRemoteDataSourceContract>(
      () => _i796.HomeRemoteDataSourceImpl(
        homeApiClient: gh<_i592.HomeApiClient>(),
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
    gh.factory<_i184.CartRepo>(
      () => _i938.CartRepoImpl(
        cartRemoteDataSourceContract: gh<_i258.CartRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i130.HomeRepo>(
      () => _i333.HomeRepoImpl(
        homeRemoteDataSourceContract: gh<_i969.HomeRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i171.GetAllProductsUseCase>(
      () => _i171.GetAllProductsUseCase(gh<_i836.ProductsRepo>()),
    );
    gh.factory<_i87.GetAllCategoriesUseCase>(
      () => _i87.GetAllCategoriesUseCase(gh<_i130.HomeRepo>()),
    );
    gh.factory<_i437.GetCategoryByIdUseCase>(
      () => _i437.GetCategoryByIdUseCase(gh<_i130.HomeRepo>()),
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
    gh.factory<_i625.AddToCartUseCase>(
      () => _i625.AddToCartUseCase(cartRepo: gh<_i184.CartRepo>()),
    );
    gh.factory<_i989.DeleteFromCartUseCase>(
      () => _i989.DeleteFromCartUseCase(cartRepo: gh<_i184.CartRepo>()),
    );
    gh.factory<_i488.GetCartUseCase>(
      () => _i488.GetCartUseCase(cartRepo: gh<_i184.CartRepo>()),
    );
    gh.factory<_i552.SearchBloc>(
      () => _i552.SearchBloc(gh<_i171.GetAllProductsUseCase>()),
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
    gh.lazySingleton<_i499.CartCubit>(
      () => _i499.CartCubit(
        addToCartUseCase: gh<_i625.AddToCartUseCase>(),
        getCartUseCase: gh<_i488.GetCartUseCase>(),
        deleteFromCartUseCase: gh<_i989.DeleteFromCartUseCase>(),
      ),
    );
    gh.lazySingleton<_i9.HomeCubit>(
      () => _i9.HomeCubit(
        getAllCategoriesUseCase: gh<_i87.GetAllCategoriesUseCase>(),
        getAllProductsUseCase: gh<_i171.GetAllProductsUseCase>(),
        getCategoryByIdUseCase: gh<_i437.GetCategoryByIdUseCase>(),
      ),
    );
    return this;
  }
}

class _$LocalModule extends _i722.LocalModule {}

class _$DioModule extends _i977.DioModule {}
