import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/cart/data/datasources/cart_remote_data_source_contract.dart';
import 'package:e_commerce/features/cart/data/models/cart_item_model.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:e_commerce/features/cart/data/response/add_to_cart_response_model.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_repo_impl_test.mocks.dart';

@GenerateMocks([CartRemoteDataSourceContract])
void main() {
  late MockCartRemoteDataSourceContract mockDataSource;
  late CartRepoImpl cartRepoImpl;

  late String productId;
  late int quantity;
  late String itemId;
  late AddToCartResponseModel addToCartResponse;
  late CartModel cartModel;
  late CartEntity cartEntity;

  setUpAll(() {
    mockDataSource = MockCartRemoteDataSourceContract();
    cartRepoImpl = CartRepoImpl(
      cartRemoteDataSourceContract: mockDataSource,
    );

    productId = 'p1';
    quantity = 2;
    itemId = 'i1';

    addToCartResponse = AddToCartResponseModel(
      message: 'Added to cart successfully',
      id: itemId,
      productId: productId,
      quantity: quantity,
    );

    cartModel = CartModel(
      cartId: 'c1',
      cartItems: [
        CartItemModel(
          itemId: itemId,
          productId: productId,
          productName: 'Test Product',
          productCoverUrl: 'https://example.com/image.jpg',
          productStock: 10,
          weightInGrams: 100.0,
          quantity: quantity,
          discountPercentage: 10,
          basePricePerUnit: 100.0,
          finalPricePerUnit: 90.0,
          totalPrice: 180.0,
        ),
      ],
    );

    cartEntity = cartModel.toEntity();

    provideDummy<BaseResponse<AddToCartResponseModel>>(
      SuccessBaseResponse<AddToCartResponseModel>(addToCartResponse),
    );
    provideDummy<BaseResponse<AddToCartResponseModel>>(
      ErrorBaseResponse<AddToCartResponseModel>('error'),
    );
    provideDummy<BaseResponse<CartModel>>(
      SuccessBaseResponse<CartModel>(cartModel),
    );
    provideDummy<BaseResponse<CartModel>>(
      ErrorBaseResponse<CartModel>('error'),
    );
    provideDummy<BaseResponse<String>>(
      SuccessBaseResponse<String>('Item deleted successfully'),
    );
    provideDummy<BaseResponse<String>>(
      ErrorBaseResponse<String>('error'),
    );
    provideDummy<BaseResponse<CartEntity>>(
      SuccessBaseResponse<CartEntity>(cartEntity),
    );
    provideDummy<BaseResponse<CartEntity>>(
      ErrorBaseResponse<CartEntity>('error'),
    );
  });

  group('cart repo impl', () {
    group('addToCart', () {
      test(
        'Return SuccessBaseResponse<AddToCartResponseModel> when addToCart is successful',
        () async {
          when(
            mockDataSource.addToCart(
              productId: productId,
              quantity: quantity,
            ),
          ).thenAnswer(
            (_) async =>
                SuccessBaseResponse<AddToCartResponseModel>(addToCartResponse),
          );

          final result = await cartRepoImpl.addToCart(
            productId: productId,
            quantity: quantity,
          );

          expect(result, isA<SuccessBaseResponse<AddToCartResponseModel>>());
          expect(
            (result as SuccessBaseResponse<AddToCartResponseModel>)
                .data
                .message,
            'Added to cart successfully',
          );
        },
      );

      test(
        'Return ErrorBaseResponse<AddToCartResponseModel> when addToCart fails',
        () async {
          when(
            mockDataSource.addToCart(
              productId: productId,
              quantity: quantity,
            ),
          ).thenAnswer(
            (_) async => ErrorBaseResponse<AddToCartResponseModel>('error'),
          );

          final result = await cartRepoImpl.addToCart(
            productId: productId,
            quantity: quantity,
          );

          expect(result, isA<ErrorBaseResponse<AddToCartResponseModel>>());
          expect(
            (result as ErrorBaseResponse<AddToCartResponseModel>).errorMessage,
            'error',
          );
        },
      );
    });

    group('getCart', () {
      test(
        'Return SuccessBaseResponse<CartEntity> when getCart is successful',
        () async {
          when(mockDataSource.getCart()).thenAnswer(
            (_) async => SuccessBaseResponse<CartModel>(cartModel),
          );

          final result = await cartRepoImpl.getCart();

          expect(result, isA<SuccessBaseResponse<CartEntity>>());
          final successResult = result as SuccessBaseResponse<CartEntity>;
          expect(successResult.data.cartId, cartEntity.cartId);
          expect(
            successResult.data.cartItems.length,
            cartEntity.cartItems.length,
          );
          expect(
            successResult.data.cartItems[0].itemId,
            cartEntity.cartItems[0].itemId,
          );
        },
      );

      test(
        'Return ErrorBaseResponse<CartEntity> when getCart fails',
        () async {
          when(mockDataSource.getCart()).thenAnswer(
            (_) async => ErrorBaseResponse<CartModel>('error'),
          );

          final result = await cartRepoImpl.getCart();

          expect(result, isA<ErrorBaseResponse<CartEntity>>());
          expect(
            (result as ErrorBaseResponse<CartEntity>).errorMessage,
            'error',
          );
        },
      );
    });

    group('deleteFromCart', () {
      test(
        'Return SuccessBaseResponse<String> when deleteFromCart is successful',
        () async {
          when(mockDataSource.deleteFromCart(itemId)).thenAnswer(
            (_) async => SuccessBaseResponse<String>('Item deleted successfully'),
          );

          final result = await cartRepoImpl.deleteFromCart(itemId);

          expect(result, isA<SuccessBaseResponse<String>>());
          expect(
            (result as SuccessBaseResponse<String>).data,
            'Item deleted successfully',
          );
        },
      );

      test(
        'Return ErrorBaseResponse<String> when deleteFromCart fails',
        () async {
          when(mockDataSource.deleteFromCart(itemId)).thenAnswer(
            (_) async => ErrorBaseResponse<String>('error'),
          );

          final result = await cartRepoImpl.deleteFromCart(itemId);

          expect(result, isA<ErrorBaseResponse<String>>());
          expect(
            (result as ErrorBaseResponse<String>).errorMessage,
            'error',
          );
        },
      );
    });
  });
}
