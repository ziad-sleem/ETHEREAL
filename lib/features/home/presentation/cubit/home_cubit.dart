import 'package:bloc/bloc.dart';
import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/config/base_state/base_state.dart';
import 'package:e_commerce/config/error_handler/error_handler.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/usecases/get_all_products_use_case.dart';
import 'package:e_commerce/features/home/domain/usecases/get_category_by_id_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/features/home/domain/usecases/get_all_categories_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetCategoryByIdUseCase _getCategoryByIdUseCase;
  HomeCubit({
    required GetAllCategoriesUseCase getAllCategoriesUseCase,
    required GetAllProductsUseCase getAllProductsUseCase,
    required GetCategoryByIdUseCase getCategoryByIdUseCase,
  }) : _getAllCategoriesUseCase = getAllCategoriesUseCase,
       _getAllProductsUseCase = getAllProductsUseCase,
       _getCategoryByIdUseCase = getCategoryByIdUseCase,
       super(HomeState());

  /// get  products
  Future<void> getProducts() async {
    try {
      if (isClosed) return;
      emit(
        state.copyWith(
          productsState: state.productsState.copyWith(isLoading: true),
        ),
      );

      final result = await _getAllProductsUseCase.call(1, 10000);

      switch (result) {
        case SuccessBaseResponse<List<ProductEntity>>():
          if (isClosed) return;
          emit(
            state.copyWith(
              productsState: state.productsState.copyWith(
                isLoading: false,
                data: result.data,
              ),
            ),
          );
        case ErrorBaseResponse<List<ProductEntity>>():
          if (isClosed) return;
          emit(
            state.copyWith(
              productsState: state.productsState.copyWith(
                isLoading: false,
                errorMessage: ErrorHandler.handle(result.errorMessage),
              ),
            ),
          );
      }
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          productsState: state.productsState.copyWith(
            isLoading: false,
            errorMessage: ErrorHandler.handle(e),
          ),
        ),
      );
    }
  }

  /// get list of product for a specific category
  List<ProductEntity> filterProductsByCategory(String categoryName) {
    final allProducts = state.productsState.data ?? [];
    if (categoryName.toLowerCase() == 'balenciaga') return allProducts;

    return allProducts.where((product) {
      final productCategories = product.categories as List<dynamic>?;
      return productCategories?.contains(categoryName) ?? false;
    }).toList();
  }

  /// get all Categories
  Future<void> getAllCategories() async {
    try {
      if (isClosed) return;
      emit(
        state.copyWith(
          categoriesState: state.categoriesState.copyWith(isLoading: true),
        ),
      );

      final result = await _getAllCategoriesUseCase.call();

      switch (result) {
        case SuccessBaseResponse<List<CategoryEntity>>():
          if (isClosed) return;
          emit(
            state.copyWith(
              categoriesState: state.categoriesState.copyWith(
                isLoading: false,
                data: result.data,
              ),
            ),
          );
        case ErrorBaseResponse<List<CategoryEntity>>():
          if (isClosed) return;
          emit(
            state.copyWith(
              categoriesState: state.categoriesState.copyWith(
                isLoading: false,
                errorMessage: ErrorHandler.handle(result.errorMessage),
              ),
            ),
          );
      }
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          categoriesState: state.categoriesState.copyWith(
            isLoading: false,
            errorMessage: ErrorHandler.handle(e),
          ),
        ),
      );
    }
  }

  /// get Category by id
  Future<void> getCategoriesById() async {
    try {
      if (isClosed) return;
      emit(
        state.copyWith(
          categoryByIdState: state.categoryByIdState.copyWith(isLoading: true),
        ),
      );

      final result = await _getCategoryByIdUseCase.call(id: '');

      switch (result) {
        case SuccessBaseResponse<CategoryEntity>():
          if (isClosed) return;
          emit(
            state.copyWith(
              categoryByIdState: state.categoryByIdState.copyWith(
                isLoading: false,
                data: result.data,
              ),
            ),
          );
        case ErrorBaseResponse<CategoryEntity>():
          if (isClosed) return;
          emit(
            state.copyWith(
              categoryByIdState: state.categoryByIdState.copyWith(
                isLoading: false,
                errorMessage: ErrorHandler.handle(result.errorMessage),
              ),
            ),
          );
      }
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          categoryByIdState: state.categoryByIdState.copyWith(
            isLoading: false,
            errorMessage: ErrorHandler.handle(e),
          ),
        ),
      );
    }
  }
}
