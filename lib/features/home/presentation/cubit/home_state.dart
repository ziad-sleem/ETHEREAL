part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BaseState<List<ProductEntity>> productsState;
  final BaseState<List<CategoryEntity>> categoriesState;
  final BaseState<CategoryEntity> categoryByIdState;

  const HomeState({
    this.productsState = const BaseState(),
    this.categoriesState = const BaseState(),
    this.categoryByIdState = const BaseState(),
  });

  HomeState copyWith({
    BaseState<List<ProductEntity>>? productsState,
    BaseState<List<CategoryEntity>>? categoriesState,
    BaseState<CategoryEntity>? categoryByIdState,
  }) {
    return HomeState(
      productsState: productsState ?? this.productsState,
      categoriesState: categoriesState ?? this.categoriesState,
      categoryByIdState: categoryByIdState ?? this.categoryByIdState,
    );
  }

  @override
  List<Object> get props => [
        productsState,
        categoriesState,
        categoryByIdState,
      ];
}
