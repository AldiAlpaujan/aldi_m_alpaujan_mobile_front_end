import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_api_repository.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_data_state.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/domain/models/response/default_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/create_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/delete_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/product_category_lookup_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/update_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/response/product_category_lookup_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/response/product_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/repositories/products_repository.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/data/src/products_api_service.dart';

class ProductsRepositoryImpl extends ApiRepository
    implements ProductsRepository {
  final ProductsApiService productsApiService;
  ProductsRepositoryImpl(this.productsApiService);

  @override
  Future<DataState<ProductRes>> getProducts(ProductReq request) {
    return getStateOf(request: () => productsApiService.getProducts(request));
  }

  @override
  Future<DataState<DefaultRes>> createProducts(CreateProductReq request) {
    return getStateOf(
      request: () => productsApiService.createProducts(request),
    );
  }

  @override
  Future<DataState<DefaultRes>> updateproducts(UpdateProductReq request) {
    return getStateOf(
      request: () => productsApiService.updateproducts(request),
    );
  }

  @override
  Future<DataState<DefaultRes>> deleteProducts(DeleteProductReq request) {
    return getStateOf(
      request: () => productsApiService.deleteProducts(request),
    );
  }

  @override
  Future<DataState<ProductCategoryLookupRes>> productCategoryLookup(
    ProductCategoryLookupReq request,
  ) {
    return getStateOf(
      request: () => productsApiService.productCategoryLookup(request),
    );
  }
}
