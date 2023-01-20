// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:annotations/json_cache_generator.dart';

import '../main_stances.dart';

part 'debt_installment.g.dart';

@cacheModel
class DebtInstallment {
  String id;
  int count;
  double value;
  double total;
  bool isPaid;
  DebtInstallment({
    required this.id,
    required this.count,
    required this.value,
    required this.total,
    required this.isPaid,
  }){
    _getTotal();
  }
  _getTotal(){
    total = count*value;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'count': count,
      'value': value,
      'total': total,
      'isPaid': isPaid,
    };
  }

  factory DebtInstallment.fromMap(Map<String, dynamic> map) {
    return DebtInstallment(
      id: map['id'] as String,
      count: map['count'] as int,
      value: double.parse(map['value'].toString()),
      total: double.parse(map['total'].toString()),
      isPaid: map['isPaid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DebtInstallment.fromJson(String source) => DebtInstallment.fromMap(json.decode(source) as Map<String, dynamic>);
}
