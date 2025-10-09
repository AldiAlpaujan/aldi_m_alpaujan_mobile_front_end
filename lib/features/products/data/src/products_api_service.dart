import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/request/product_req.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/response/product_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/constants/apis.dart';

part 'products_api_service.g.dart';

@RestApi()
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio) = _ProductsApiService;

  @GET(Apis.products)
  Future<HttpResponse<ProductRes>> getProducts(@Queries() ProductReq request);
}
