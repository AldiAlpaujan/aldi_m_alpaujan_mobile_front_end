import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_data_state.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/extensions/object_extension.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/main_helpers.dart';

mixin HandlerApiMixin {
  @protected
  void handleApiResult<T>(
    DataState<T> result, {
    bool showFailedMsg = true,
    bool showErrorDataTypeMsg = true,
    Function(T?)? onSuccess,
    Function(DioException?)? onError,
  }) {
    if (result is DataSuccess) {
      if (!onSuccess.isNull) onSuccess!(result.data);
    } else if (result is DataFailed) {
      if (showFailedMsg) {
        final err = result.error!;
        final code = err.response?.statusCode;
        final message =
            err.response?.data['message'] ?? "tidak dapat mengirim permintaan";

        if (code == 401) return;
        if (code == 500) {
          modalHelper.error(message: message);
        } else {
          modalHelper.info(message: message);
        }
      }
      if (!onError.isNull) onError!(result.error);
    } else if (result is ErrorDataType) {
      if (showFailedMsg) {
        modalHelper.error(message: "Ups, terjadi kesalahan saat menerima data");
      }
    }
  }
}
