import 'package:aldi_m_alpaujan_mobile_front_end/config/theme/theme.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_empty_data.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/reimburs/presentation/controllers/reimburs.controller.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/formatter_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReimbursListPage extends GetView<ReimbursController> with FormatterMixin {
  const ReimbursListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Reimburs')),
      body: Obx(
        () => Stack(
          children: [
            if (controller.data().isEmpty) const AppEmptyData(),
            ListView(
              children: [
                ...controller.data().map((e) {
                  return ListTile(
                    title: Text(e.detail, style: TextStyle(fontSize: 14)),
                    subtitle: Text(
                      dateFormatUI(
                        DateTime.parse(e.date),
                        format: 'dd MMMM yyyy',
                      ),
                      style: TextStyle(fontSize: 12, color: AppTheme.capColor),
                    ),
                    trailing: Text(e.claimType, style: TextStyle(fontSize: 12)),
                    dense: true,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
