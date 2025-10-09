import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_data_state.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_usecase.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/domain/models/response/default_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/update_product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/repositories/products_repository.dart';

class UpdateProductsUc
    extends UseCase<DataState<DefaultRes>, UpdateProductReq> {
  final ProductsRepository productsRepository;
  UpdateProductsUc(this.productsRepository);

  @override
  Future<DataState<DefaultRes>> call({UpdateProductReq? request}) {
    return productsRepository.updateproducts(request!);
  }
}
