// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponseModel _$GetAllCategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesResponseModel(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetAllCategoriesResponseModelToJson(
  GetAllCategoriesResponseModel instance,
) => <String, dynamic>{'categories': instance.categories};
