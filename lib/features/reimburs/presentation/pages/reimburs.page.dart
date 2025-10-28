import 'package:aldi_m_alpaujan_mobile_front_end/app/routes/pages.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/theme/theme.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_fix_btm_button.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_textfield_input.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/reimburs/presentation/widget/proof_card.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/validator_mixin.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/widget_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/reimburs/presentation/controllers/reimburs.controller.dart';
import 'package:get/get.dart';

class ReimbursPage extends GetView<ReimbursController> with ValidatorMixin {
  const ReimbursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Reimburs'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.reimbursList),
            icon: const Icon(Icons.document_scanner_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppTheme.padding),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    AppTextFieldInput(
                      readOnly: true,
                      label: "Tanggal",
                      hintText: 'Pilih tanggal',
                      controller: controller.dateC,
                      validator: (v) => emptyValidator('Detail', v!),
                      onTap: controller.onPickDate,
                    ).b(8),
                    AppTextFieldInput(
                      isRequired: true,
                      isDropDown: true,
                      label: "Jenis Klaim",
                      hintText: 'Pilih jenis klaim',
                      dropDownInitialValue: controller.claimTypeC.text,
                      dropDownItems: controller.claimTypes,
                      controller: controller.claimTypeC,
                      validator: (v) =>
                          emptyValidator('Kelompok barang', v ?? ''),
                    ).b(8),
                    AppTextFieldInput(
                      isArea: true,
                      label: "Detail",
                      hintText: 'Masukkan detail',
                      controller: controller.detailC,
                      validator: (v) => emptyValidator('Detail', v!),
                    ).b(10),

                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 10,
                            children: [
                              Text("Lampiran Bukti"),
                              ElevatedButton(
                                onPressed: controller.addProof,
                                child: Text(
                                  "Klik untuk upload file dan isi nominal",
                                ),
                              ),
                              Obx(
                                () => Column(
                                  children: controller.proofs
                                      .map(
                                        (e) => ProofCard(proof: e).onTap(
                                          () => controller.addProof(proof: e),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppFixBtmButton(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.createReimburs,
                child: Text("Submit Request"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
