import 'package:flutter/material.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/products/presentation/controllers/product_form.controller.dart';
import 'package:get/get.dart';

class ProductFormPage extends GetView<ProductFormController> {
  const ProductFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('productform')),
      body: const Center(child: Text('productform')),
    );
  }
}
