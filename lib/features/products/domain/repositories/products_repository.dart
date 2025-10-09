import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_data_state.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/domain/models/response/default_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/create_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/delete_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/update_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/response/product_res.dart';

abstract class ProductsRepository {
  Future<DataState<ProductRes>> getProducts(ProductReq request);

  Future<DataState<DefaultRes>> createProducts(CreateProductReq request);

  Future<DataState<DefaultRes>> updateproducts(UpdateProductReq request);

  Future<DataState<DefaultRes>> deleteProducts(DeleteProductReq request);
}
