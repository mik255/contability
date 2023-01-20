import 'dart:convert';
import 'package:annotations/json_cache_generator.dart';
import 'package:contability/main_stances.dart';


import 'debt.dart';

part 'credit_card.g.dart';

enum Status { paid, open, late }

@cacheModel
class CreditCard {
  String id;
  String name;
  String imgPath;
  double balanceAvailableLimit;
  double balanceTotalLimit;
  int invoiceClosingDay;
  DateTime lastPaid;
  List<Debt> debts;
  late Status status;
  late double totalMonth;

  CreditCard({
    required this.id,
    required this.name,
    required this.imgPath,
    required this.balanceAvailableLimit,
    required this.invoiceClosingDay,
    required this.balanceTotalLimit,
    required this.debts,
    required this.lastPaid,
  }) {
    getStatus();
  }

  double getTotalOfMonthDebts() {
    totalMonth = 0;
    for (var element in debts) {
      totalMonth += element.getCurrentInstallment().total;
    }
    return totalMonth;
  }

  getStatus() {
    DateTime now = DateTime.now();
    if (lastPaid.month == (now.month - 1 == 0 ? 12 : now.month - 1) &&
        now.day < invoiceClosingDay) {
      status = Status.paid;
      return;
    }
    if (lastPaid.month == (now.month - 1 == 0 ? 12 : now.month - 1) &&
        now.day > invoiceClosingDay) {
      status = Status.late;
      return;
    }
    status = Status.open;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imgPath': imgPath,
      'balanceAvailableLimit': balanceAvailableLimit,
      'balanceTotalLimit': balanceTotalLimit,
      'invoiceClosingDay': invoiceClosingDay,
      'lastPaid': lastPaid.millisecondsSinceEpoch,
      'debts': debts.map((x) => x.toMap()).toList(),
      'status': status.toString(),
    };
  }

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    return CreditCard(
      id: map['id'] as String,
      name: map['name'] as String,
      imgPath: map['imgPath'] as String,
      balanceAvailableLimit: double.parse(map['balanceAvailableLimit'].toString()),
      balanceTotalLimit: double.parse(map['balanceTotalLimit'].toString()),
      invoiceClosingDay: map['invoiceClosingDay'] as int,
      lastPaid: DateTime.fromMillisecondsSinceEpoch(map['lastPaid'] as int),
      debts: List<Debt>.from(
        (map['debts'] as List<dynamic>).map<Debt>(
          (x) => Debt.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCard.fromJson(String source) =>
      CreditCard.fromMap(json.decode(source) as Map<String, dynamic>);
}
