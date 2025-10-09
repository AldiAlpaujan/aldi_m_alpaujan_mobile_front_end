import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_data_state.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_usecase.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/product_category_lookup_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/response/product_category_lookup_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/repositories/products_repository.dart';

class ProductCategoryLookupUc
    extends
        UseCase<DataState<ProductCategoryLookupRes>, ProductCategoryLookupReq> {
  final ProductsRepository productsRepository;
  ProductCategoryLookupUc(this.productsRepository);

  @override
  Future<DataState<ProductCategoryLookupRes>> call({
    ProductCategoryLookupReq? request,
  }) {
    return productsRepository.productCategoryLookup(request!);
  }
}
