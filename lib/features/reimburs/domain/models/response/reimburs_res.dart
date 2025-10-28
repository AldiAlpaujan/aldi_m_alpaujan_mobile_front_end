import 'dart:io';

class Reimburs {
  final String date;
  final String claimType;
  final String detail;

  final List<Proof> proofs;

  Reimburs({
    required this.date,
    required this.claimType,
    required this.detail,
    required this.proofs,
  });
}

class Proof {
  final List<File> files;
  final double nominal;
  final String notes;

  Proof({required this.files, required this.nominal, required this.notes});
}
