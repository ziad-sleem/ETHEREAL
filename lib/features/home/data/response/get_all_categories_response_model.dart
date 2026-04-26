import 'package:json_annotation/json_annotation.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';

part 'get_all_categories_response_model.g.dart';

@JsonSerializable()
class GetAllCategoriesResponseModel {
  @JsonKey(name: 'categories')
  final List<CategoryModel> categories;

  GetAllCategoriesResponseModel({required this.categories});

  factory GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$GetAllCategoriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCategoriesResponseModelToJson(this);
}
