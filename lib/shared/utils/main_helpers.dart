import 'package:dio/dio.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/modal_helpers.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/session.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_core/src/get_main.dart';

final dio = Get.find<Dio>();
final session = Get.find<Session>();
final modalHelper = Get.find<ModalHelper>();
