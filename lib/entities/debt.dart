import 'dart:convert';
import 'package:annotations/json_cache_generator.dart';
import 'package:contability/main_stances.dart';

import 'debt_installment.dart';

part 'debt.g.dart';

enum DebtStatus { finish, actual }

@cacheModel
class Debt {
  String id;
  String name;
  DateTime endDate;
  DateTime startDate;
  List<DebtInstallment> installmentList;
  DebtStatus status;
  Debt({
    required this.name,
    required this.id,
    required this.installmentList,
    required this.endDate,
    required this.startDate,
    required this.status,
  });

  generateInstallmentList(int count, value) {
    installmentList = List.generate(
        count,
        (index) => DebtInstallment(
              id: index.hashCode.toString(),
              count: count-index,
              value: value,
              isPaid: false,
              total: ((count-index)* value).toDouble(),
            ));
  }

  DebtInstallment getCurrentInstallment() {
    return installmentList.where((element) => !element.isPaid).reduce(
        (value, element) => value.count > element.count ? value : element);

  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'endDate': endDate.millisecondsSinceEpoch,
      'startDate': startDate.millisecondsSinceEpoch,
      'installmentList': installmentList.map((x) => x.toMap()).toList(),
      'status': status.name,
    };
  }

  factory Debt.fromMap(Map<String, dynamic> map) {
    return Debt(
      id: map['id'] as String,
      name: map['name'] as String,
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      installmentList: List<DebtInstallment>.from(
        (map['installmentList'] as List<dynamic>).map<DebtInstallment>(
          (x) => DebtInstallment.fromMap(x),
        ),
      ),
      status: DebtStatus.values.byName(map['status'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Debt.fromJson(String source) =>
      Debt.fromMap(json.decode(source) as Map<String, dynamic>);
}
