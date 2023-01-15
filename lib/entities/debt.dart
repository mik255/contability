


import 'Installment.dart';

enum DebtStatus{
  finish,
  actual,
}

class Debt {
  String name;
  DateTime endDate;
  DateTime startDate;
  List<Installment> installmentList;
  DebtStatus status;
  Debt({
    required this.name,
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
}
