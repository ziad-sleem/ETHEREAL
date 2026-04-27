part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  final SearchStatus status;
  final List<ProductEntity> products; // All loaded products so far
  final List<ProductEntity> filteredProducts; // Products that match the search query
  final bool hasReachedMax;
  final int page;
  final String errorMessage;
  final String query;

  const SearchState({
    this.status = SearchStatus.initial,
    this.products = const [],
    this.filteredProducts = const [],
    this.hasReachedMax = false,
    this.page = 1,
    this.errorMessage = '',
    this.query = '',
  });

  SearchState copyWith({
    SearchStatus? status,
    List<ProductEntity>? products,
    List<ProductEntity>? filteredProducts,
    bool? hasReachedMax,
    int? page,
    String? errorMessage,
    String? query,
  }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
      query: query ?? this.query,
    );
  }

  @override
  List<Object> get props => [
        status,
        products,
        filteredProducts,
        hasReachedMax,
        page,
        errorMessage,
        query,
      ];
}
