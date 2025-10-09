import 'package:aldi_m_alpaujan_mobile_front_end/features/common/presentation/views/app_data_list_view.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_bar_search.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_card_list.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/widget_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/presentation/controllers/product_category.controller.dart';
import 'package:get/get.dart';

class ProductCategoryPage extends GetView<ProductCategoryController> {
  const ProductCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(
        title: 'Kategori Barang',
        centerTitle: true,
        onChanged: (v) => controller.getData(keyword: v),
      ),
      body: Obx(
        () => AppDataListView(
          noData: controller.noData,
          isError: controller.isError,
          isLoading: controller.isLoading,
          emptyData: controller.data.isEmpty,
          refreshData: () => controller.refreshData(),
          loadData: () => controller.loadData(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            ...controller.data.map((item) {
              return AppCardList(
                isLast: item == controller.data.last,
                child: Text(item.name),
              ).onTap(() => Get.back(result: item));
            }),
          ],
        ),
      ),
    );
  }
}
