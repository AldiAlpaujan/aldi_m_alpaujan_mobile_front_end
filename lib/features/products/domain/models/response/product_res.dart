import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_res.g.dart';

@JsonSerializable()
class ProductRes extends BaseResponse<List<Product>> {
  ProductRes() : super();

  factory ProductRes.fromJson(Map<String, dynamic> json) =>
      _$ProductResFromJson(json);
}

@JsonSerializable()
class Product {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'stock')
  final int stock;
  @JsonKey(name: 'group')
  final String group;
  @JsonKey(name: 'price')
  final double price;

  Product({
    required this.id,
    required this.productName,
    required this.stock,
    required this.group,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
