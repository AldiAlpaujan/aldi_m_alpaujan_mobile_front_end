import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_card_list.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/reimburs/domain/models/response/reimburs_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/formatter_mixin.dart';
import 'package:flutter/material.dart';

class ProofCard extends StatelessWidget with FormatterMixin {
  final Proof proof;
  const ProofCard({super.key, required this.proof});

  @override
  Widget build(BuildContext context) {
    return AppCardList(
      isLast: true,
      child: Row(
        spacing: 10,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(proof.files[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(child: Text(proof.notes)),
          Text(moneyFormatter(proof.nominal)),
        ],
      ),
    );
  }
}
