import 'package:aldi_m_alpaujan_mobile_front_end/config/theme/theme.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/domain/models/response/product_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/presentation/controllers/products.controller.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/formatter_mixin.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/widget_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends GetView<ProductsController>
    with FormatterMixin {
  final Product item;
  const ProductDetailView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: 6,
          decoration: BoxDecoration(
            color: Color(0xFFE2E8F0),
            borderRadius: BorderRadius.circular(10),
          ),
        ).b(12),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              keyValueItem('Nama Barang', item.productName),
              keyValueItem('Kategori', item.categoryName),
              keyValueItem('Kelompok', item.group),
              keyValueItem('Stok', item.stock.toString(), withBorder: false),
            ],
          ),
        ).b(12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          decoration: BoxDecoration(
            color: Color(0xFFF1F4F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                'Harga',
                style: TextStyle(fontWeight: FontWeight.w600),
              ).expand,
              Text(
                moneyFormatter(item.price),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF68778D),
                ),
              ),
            ],
          ),
        ).b(16),
        Row(
          spacing: 12,
          children: [
            TextButton(
              onPressed: () =>
                  controller.deleteProducts([item.id], onSuccess: Get.back),
              style: TextButton.styleFrom(
                overlayColor: Colors.red,
                side: BorderSide(width: 1.2, color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Hapus Barang", style: TextStyle(color: Colors.red)),
            ).expand,
            ElevatedButton(
              onPressed: () => controller.openForm(item: item),
              child: Text("Edit Barang"),
            ).expand,
          ],
        ),
      ],
    ).all(12);
  }

  Widget keyValueItem(String key, String value, {bool withBorder = true}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        border: withBorder
            ? Border(bottom: BorderSide(color: AppTheme.borderColor, width: .8))
            : null,
      ),
      child: Row(
        children: [
          Text(key, style: TextStyle(fontWeight: FontWeight.w600)).expand,
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF68778D),
            ),
          ),
        ],
      ),
    );
  }
}
