import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/core/data/datasources/products_remote_data_source_contract.dart';
import 'package:e_commerce/core/data/models/pagination_model.dart';
import 'package:e_commerce/core/data/models/product_model.dart';
import 'package:e_commerce/core/domain/entities/pagination_entity.dart';
import 'package:e_commerce/core/domain/entities/product_entity.dart';
import 'package:e_commerce/core/domain/repos/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSourceContract productsRemoteDataSourceContract;

  ProductsRepoImpl({required this.productsRemoteDataSourceContract});

  @override
  Future<BaseResponse<PaginationEntity<ProductEntity>>> getProducts(int page, int pageSize) async {
    final response = await productsRemoteDataSourceContract.getProducts(
      page,
      pageSize,
    );

    switch (response) {
      case SuccessBaseResponse<PaginationModel<ProductModel>>():
        return SuccessBaseResponse<PaginationEntity<ProductEntity>>(
          PaginationEntity(
            items: response.data.items.map((e) => e.toEntity()).toList(),
            page: response.data.page,
            pageSize: response.data.pageSize,
            totalCount: response.data.totalCount,
            hasNextPage: response.data.hasNextPage,
            hasPreviousPage: response.data.hasPreviousPage,
          ),
        );
      case ErrorBaseResponse<PaginationModel<ProductModel>>():
        return ErrorBaseResponse<PaginationEntity<ProductEntity>>(
          response.errorMessage,
        );
    }
  }
}
