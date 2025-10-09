import 'package:get/get_instance/get_instance.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/app/bindings/feature_bindings/products_bindings.dart';

class FeatureBindings extends Bindings {
  @override
  void dependencies() {
    ProductsBindings().dependencies();
  }
}
