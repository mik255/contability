


import 'dart:convert';
import 'Installment.dart';

enum DebtStatus{
  finish,
  actual,
}


class Debt {
  String id;
  String name;
  DateTime endDate;
  DateTime startDate;
  List<Installment> installmentList;
  DebtStatus status;
  Debt({
    required this.name,
    required this.id,
    required this.installmentList,
    required this.endDate,
    required this.startDate,
    required this.status,
  });
  generate(int count,value){
    installmentList = List.generate(count, (index)
    => Installment(count: index+1,value: value,isPaid: false));
  }
  Installment getCurrentInstallment(){
    return installmentList.where((element) =>
    element.isPaid).reduce((value, element) => value.count < element.count?value:element);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'endDate': endDate.millisecondsSinceEpoch,
      'startDate': startDate.millisecondsSinceEpoch,
      'installmentList': installmentList.map((x) => x.toMap()).toList(),
    };
  }

  factory Debt.fromMap(Map<String, dynamic> map) {
    return Debt(
      id: map['id'] as String,
      name: map['name'] as String,
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      installmentList: List<Installment>.from((map['installmentList'] as List<dynamic>).map<Installment>((x) => Installment.fromMap(x),),),
      status: DebtStatus.values.byName(map['status'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Debt.fromJson(String source) => Debt.fromMap(json.decode(source) as Map<String, dynamic>);
}

