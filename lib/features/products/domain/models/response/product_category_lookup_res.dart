import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_category_lookup_res.g.dart';

@JsonSerializable()
class ProductCategoryLookupRes extends BaseResponse<List<ProductCategory>> {
  ProductCategoryLookupRes() : super();

  factory ProductCategoryLookupRes.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryLookupResFromJson(json);
}

@JsonSerializable()
class ProductCategory {
  final int id;
  final String label;

  ProductCategory({required this.id, required this.label});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
