
import 'debt.dart';
enum Status{
  paid,
  open,
  late
}
class CreditCard {
  String name;
  String imgPath;
  double balanceAvailableLimit;
  double balanceTotalLimit;
  DateTime invoiceClosing;
  List<Debt> debts;
  Status status;
  CreditCard({
    required this.name,
    required this.imgPath,
    required this.balanceAvailableLimit,
    required this.invoiceClosing,
    required this.balanceTotalLimit,
    required this.debts,
    required this.status,
  });
}
