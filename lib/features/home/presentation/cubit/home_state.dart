part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BaseState<List<ProductEntity>> productsState;
  final BaseState<List<CategoryEntity>> categoriesState;
  final BaseState<CategoryEntity> categoryByIdState;
  final List<CategoryWithProducts> categoryTabs;

  const HomeState({
    this.productsState = const BaseState(),
    this.categoriesState = const BaseState(),
    this.categoryByIdState = const BaseState(),
    this.categoryTabs = const [],
  });

  HomeState copyWith({
    BaseState<List<ProductEntity>>? productsState,
    BaseState<List<CategoryEntity>>? categoriesState,
    BaseState<CategoryEntity>? categoryByIdState,
    List<CategoryWithProducts>? categoryTabs,
  }) {
    return HomeState(
      productsState: productsState ?? this.productsState,
      categoriesState: categoriesState ?? this.categoriesState,
      categoryByIdState: categoryByIdState ?? this.categoryByIdState,
      categoryTabs: categoryTabs ?? this.categoryTabs,
    );
  }

  @override
  List<Object> get props => [
        productsState,
        categoriesState,
        categoryByIdState,
        categoryTabs,
      ];
}
