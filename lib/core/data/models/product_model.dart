import 'package:e_commerce/core/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'productCode')
  final String productCode;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'arabicName')
  final String arabicName;
  @JsonKey(name: 'arabicDescription')
  final String arabicDescription;
  @JsonKey(name: 'coverPictureUrl')
  final String coverPictureUrl;
  @JsonKey(name: 'productPictures')
  final List<String>? productPictures;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'stock')
  final int stock;
  @JsonKey(name: 'weight')
  final double weight;
  @JsonKey(name: 'color')
  final String color;
  @JsonKey(name: 'rating')
  final double rating;
  @JsonKey(name: 'reviewsCount')
  final int reviewsCount;
  @JsonKey(name: 'discountPercentage')
  final double discountPercentage;
  @JsonKey(name: 'sellerId')
  final String sellerId;
  @JsonKey(name: 'categories')
  final List<String> categories;

  ProductModel({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.sellerId,
    required this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() => ProductEntity(
        id: id,
        productCode: productCode,
        name: name,
        description: description,
        arabicName: arabicName,
        arabicDescription: arabicDescription,
        coverPictureUrl: coverPictureUrl,
        productPictures: productPictures,
        price: price,
        stock: stock,
        weight: weight,
        color: color,
        rating: rating,
        reviewsCount: reviewsCount,
        discountPercentage: discountPercentage,
        sellerId: sellerId,
        categories: categories,
      );
}
