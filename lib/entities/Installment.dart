// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Installment {
  int count;
  double value;
  double total;
  bool isPaid;
  Installment({
    required this.count,
    required this.value,
    this.total = 0,
    required this.isPaid,
  }){
    _getTotal();
  }
  _getTotal(){
    total = count*value;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'value': value,
      'total': total,
      'isPaid': isPaid,
    };
  }

  factory Installment.fromMap(Map<String, dynamic> map) {
    return Installment(
      count: map['count'] as int,
      value: map['value'] as double,
      total: map['total'] as double,
      isPaid: map['isPaid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Installment.fromJson(String source) => Installment.fromMap(json.decode(source) as Map<String, dynamic>);
}
