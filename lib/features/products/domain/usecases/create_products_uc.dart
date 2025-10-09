import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_data_state.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_usecase.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/domain/models/response/default_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/create_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/repositories/products_repository.dart';

class CreateProductsUc
    extends UseCase<DataState<DefaultRes>, CreateProductReq> {
  final ProductsRepository productsRepository;
  CreateProductsUc(this.productsRepository);

  @override
  Future<DataState<DefaultRes>> call({CreateProductReq? request}) {
    return productsRepository.createProducts(request!);
  }
}
