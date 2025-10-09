import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_api_repository.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_data_state.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/product_req.dart';
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
}
