import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';
import 'package:e_commerce/features/home/data/repositories/home_repo_impl.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSourceContract])
void main() {
  late MockHomeRemoteDataSourceContract mockHomeRemoteDataSourceContract;
  late HomeRepoImpl homeRepoImpl;

  setUpAll(() {
    mockHomeRemoteDataSourceContract = MockHomeRemoteDataSourceContract();
    homeRepoImpl = HomeRepoImpl(
      homeRemoteDataSourceContract: mockHomeRemoteDataSourceContract,
    );

    // provideDummy<BaseResponse<List<ProductModel>>>(
    //   SuccessBaseResponse<List<ProductModel>>([]),
    // );

    // provideDummy<BaseResponse<List<ProductEntity>>>(
    //   SuccessBaseResponse<List<ProductEntity>>([]),
    // );

    // provideDummy<ErrorBaseResponse<List<ProductEntity>>>(
    //   ErrorBaseResponse<List<ProductEntity>>(''),
    // );

    provideDummy<BaseResponse<List<CategoryModel>>>(
      SuccessBaseResponse<List<CategoryModel>>([]),
    );

    provideDummy<BaseResponse<List<CategoryEntity>>>(
      SuccessBaseResponse<List<CategoryEntity>>([]),
    );

    provideDummy<ErrorBaseResponse<List<CategoryEntity>>>(
      ErrorBaseResponse<List<CategoryEntity>>(''),
    );

    
  });

  group(('home repo impl'), () {
    // group(('get all products'), () {
    //   test(
    //     "Return SuccessBaseResponse<List<ProductEntity>> when get all products is successful",
    //     () async {
    //       when(mockHomeRemoteDataSourceContract.getProducts(1, 10)).thenAnswer(
    //         (_) async => SuccessBaseResponse<List<ProductModel>>([]),
    //       );

    //       final result = await homeRepoImpl.getProducts(1, 10);

    //       expect(result, isA<SuccessBaseResponse<List<ProductEntity>>>());
    //     },
    //   );

    //   test(
    //     "Return ErrorBaseResponse<List<ProductEntity>> when get all products is failed",
    //     () async {
    //       when(mockHomeRemoteDataSourceContract.getProducts(1, 10)).thenAnswer(
    //         (_) async => ErrorBaseResponse<List<ProductModel>>('Error'),
    //       );

    //       final result = await homeRepoImpl.getProducts(1, 10);

    //       expect(result, isA<ErrorBaseResponse<List<ProductEntity>>>());
    //     },
    //   );

    //   test(
    //     "Return SuccessBaseResponse<List<ProductEntity>> with empty list when get all products is empty",
    //     () async {
    //       when(mockHomeRemoteDataSourceContract.getProducts(1, 10)).thenAnswer(
    //         (_) async => SuccessBaseResponse<List<ProductModel>>([]),
    //       );

    //       final result = await homeRepoImpl.getProducts(1, 10);

    //       expect(result, isA<SuccessBaseResponse<List<ProductEntity>>>());
    //       expect(
    //         (result as SuccessBaseResponse<List<ProductEntity>>).data,
    //         isEmpty,
    //       );
    //     },
    //   );
    // });

    group('get all categories', () {
      test(
        "Return SuccessBaseResponse<List<CategoryEntity>> when get all categories is successful",
        () async {
          when(mockHomeRemoteDataSourceContract.getCategories()).thenAnswer(
            (_) async => SuccessBaseResponse<List<CategoryModel>>([]),
          );

          final result = await homeRepoImpl.getCategories();

          expect(result, isA<SuccessBaseResponse<List<CategoryEntity>>>());
        },
      );

      test(
        "Return ErrorBaseResponse<List<CategoryEntity>> when get all categories is failed",
        () async {
          when(mockHomeRemoteDataSourceContract.getCategories()).thenAnswer(
            (_) async => ErrorBaseResponse<List<CategoryModel>>('Error'),
          );

          final result = await homeRepoImpl.getCategories();

          expect(result, isA<ErrorBaseResponse<List<CategoryEntity>>>());
        },
      );

      test(
        "Return SuccessBaseResponse<List<CategoryEntity>> with empty list when get all categories is empty",
        () async {
          when(mockHomeRemoteDataSourceContract.getCategories()).thenAnswer(
            (_) async => SuccessBaseResponse<List<CategoryModel>>([]),
          );

          final result = await homeRepoImpl.getCategories();

          expect(result, isA<SuccessBaseResponse<List<CategoryEntity>>>());
          expect(
            (result as SuccessBaseResponse<List<CategoryEntity>>).data,
            isEmpty,
          );
        },
      );
    });

    group('get category by id', () {
      test(
        "Return SuccessBaseResponse<List<CategoryEntity>> when get category by id is successful",
        () async {
          when(mockHomeRemoteDataSourceContract.getCategories()).thenAnswer(
            (_) async => SuccessBaseResponse<List<CategoryModel>>([]),
          );

          final result = await homeRepoImpl.getCategories();

          expect(result, isA<SuccessBaseResponse<List<CategoryEntity>>>());
          expect(
            (result as SuccessBaseResponse<List<CategoryEntity>>).data,
            isEmpty,
          );
        },
      );
    });
  });
}
