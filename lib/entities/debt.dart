


import 'Installment.dart';

class Debt {
  String name;
  DateTime endDate;
  Installment initialInstallment;
  Installment currentInstallment;
  Debt({
    required this.name,
    required this.initialInstallment,
    required this.currentInstallment,
    required this.endDate,
  });
}
