import 'dart:io';

import 'package:aldi_m_alpaujan_mobile_front_end/config/theme/theme.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_textfield_input.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/reimburs/domain/models/response/reimburs_res.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/formatter_mixin.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/function.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/validator_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProofForm extends StatefulWidget {
  final Proof? proof;
  final Function(List<File>, double, String) onSubmit;
  const AddProofForm({super.key, required this.onSubmit, this.proof});

  @override
  State<AddProofForm> createState() => _AddProofFormState();
}

class _AddProofFormState extends State<AddProofForm>
    with ValidatorMixin, FormatterMixin {
  final formKey = GlobalKey<FormState>();

  final files = <File>[].obs;
  final nominalC = TextEditingController();
  final notesC = TextEditingController();
  double nominal = 0;

  void pickImage() {
    Func.pickImage(context).then((value) {
      if (value != null) {
        files.add(value);
      }
    });
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      widget.onSubmit(files(), nominal, notesC.text);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.proof != null) {
      files.value = widget.proof!.files;
      nominal = widget.proof!.nominal;
      notesC.text = widget.proof!.notes;
      nominalC.text = doubleFormatter(widget.proof!.nominal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.padding),
      child: Obx(
        () => Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: pickImage, child: Text("Upload")),
                if (files().isNotEmpty) ...[
                  Row(
                    children: [
                      ...files().map(
                        (e) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: FileImage(e),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                AppTextFieldInput(
                  isRequired: true,
                  isCurrency: true,
                  label: "Nominal",
                  hintText: 'Masukkan nominal',
                  controller: nominalC,
                  onCurrencyChanged: (v) => nominal = v,
                  validator: (v) => emptyValidator('Nominal', v!),
                ),
                AppTextFieldInput(
                  isArea: true,
                  label: "Keterangan",
                  hintText: 'Masukkan keterangan',
                  controller: notesC,
                  validator: (v) => emptyValidator('Keterangan', v!),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: submit,
                    child: Text("Simpan"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
