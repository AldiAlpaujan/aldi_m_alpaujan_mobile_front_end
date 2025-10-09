import 'package:aldi_m_alpaujan_mobile_front_end/shared/constants/apis.dart';
import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

Dio initDio() {
  return Dio(
    BaseOptions(
      baseUrl: Apis.url,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      followRedirects: false,
    ),
  )..interceptors.add(DioInterceptor());
}
