import 'package:aldi_m_alpaujan_mobile_front_end/app/bindings/core_bindings.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/app/bindings/feature_bindings.dart';
import 'package:get/get_instance/get_instance.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    CoreBindings().dependencies();
    FeatureBindings().dependencies();
  }
}
