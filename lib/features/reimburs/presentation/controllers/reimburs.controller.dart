import 'package:aldi_m_alpaujan_mobile_front_end/app/routes/pages.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/reimburs/domain/models/response/reimburs_res.dart';

import 'package:aldi_m_alpaujan_mobile_front_end/features/reimburs/presentation/widget/add_proof_form.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/handler_api_mixin.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/main_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReimbursController extends GetxController with HandlerApiMixin {
  final formKey = GlobalKey<FormState>();
  final dateC = TextEditingController();
  final claimTypeC = TextEditingController();
  final detailC = TextEditingController();

  final proofs = <Proof>[].obs;

  final data = <Reimburs>[].obs;

  final claimTypes = [
    "Makan Siang",
    "Benis Oprasional",
    "Kacamata (Optik)",
    "Rawat Inap (Inpatient)",
    "Rawat Jalan (Outpatient)",
    "Gigi (Dental)",
  ];

  Future<void> createReimburs() async {
    if (formKey.currentState!.validate()) {
      if (proofs.isEmpty) {
        modalHelper.info(message: 'Silahkan tambahkan bukti');
        return;
      }

      final reimburs = Reimburs(
        date: dateC.text,
        claimType: claimTypeC.text,
        detail: detailC.text,
        proofs: proofs,
      );
      data.add(reimburs);

      dateC.clear();
      claimTypeC.clear();
      detailC.clear();
      proofs.clear();

      Get.toNamed(Routes.reimbursList);
    }
  }

  void onPickDate() {
    modalHelper.showDatePicker((v) => dateC.text = v.toString());
  }

  void addProof({Proof? proof}) {
    modalHelper.showBottomBar(
      AddProofForm(
        proof: proof,
        onSubmit: (files, nominal, notes) {
          Get.back();
          proofs.add(Proof(files: files, nominal: nominal, notes: notes));
        },
      ),
    );
  }
}
