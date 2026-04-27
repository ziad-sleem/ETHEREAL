import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/config/error_handler/error_handler.dart';
import 'package:e_commerce/core/domain/entities/pagination_entity.dart';
import 'package:e_commerce/core/domain/entities/product_entity.dart';
import 'package:e_commerce/core/domain/usecases/get_all_products_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetAllProductsUseCase _getAllProductsUseCase;
  static const int _pageSize = 10;

  SearchBloc(this._getAllProductsUseCase) : super(const SearchState()) {
    on<FetchProducts>(_onFetchProducts);
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<SearchState> emit,
  ) async {
    // Prevent fetching if we've reached the end of the pagination
    if (state.hasReachedMax) return;

    if (state.status == SearchStatus.initial) {
      emit(state.copyWith(status: SearchStatus.loading));
    }

    try {
      final result = await _getAllProductsUseCase.call(state.page, _pageSize);

      switch (result) {
        case SuccessBaseResponse<PaginationEntity<ProductEntity>>():
          final products = result.data.items;
          final hasReachedMax = products.length < _pageSize;

          // Combine the previously loaded products with the newly fetched ones
          final allProducts = List.of(state.products)..addAll(products);

          emit(
            state.copyWith(
              status: SearchStatus.success,
              products: allProducts,
              filteredProducts: _filterProducts(allProducts, state.query),
              hasReachedMax: hasReachedMax,
              page: state.page + 1, // Increment the page for the next fetch
            ),
          );

        case ErrorBaseResponse<PaginationEntity<ProductEntity>>():
          emit(
            state.copyWith(
              status: SearchStatus.failure,
              errorMessage: ErrorHandler.handle(result.errorMessage),
            ),
          );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchStatus.failure,
          errorMessage: ErrorHandler.handle(e),
        ),
      );
    }
  }

  void _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        query: event.query,
        filteredProducts: _filterProducts(state.products, event.query),
      ),
    );
  }

  // Helper method to filter products based on the query string
  List<ProductEntity> _filterProducts(
    List<ProductEntity> products,
    String query,
  ) {
    if (query.isEmpty) return products; // Show all products if query is empty

    final lowerQuery = query.toLowerCase();

    return products.where((product) {
      final nameMatch = product.name.toLowerCase().contains(lowerQuery);
      final categoryMatch = product.categories.any(
        (category) => category.toLowerCase().contains(lowerQuery)
      );
      
      return nameMatch || categoryMatch;
    }).toList();
  }
}
