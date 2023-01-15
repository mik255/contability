
import 'dart:convert';

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
  int invoiceClosingDay;
  DateTime lastPaid;
  List<Debt> debts;
  Status status;
  late double totalMonth;
  CreditCard({
    required this.name,
    required this.imgPath,
    required this.balanceAvailableLimit,
    required this.invoiceClosingDay,
    required this.balanceTotalLimit,
    required this.debts,
    required this.status,
    required this.lastPaid,
  });
  static CreditCard fromJsonEncodedString(String e){
    return json.decode(e) as CreditCard;
  }
  double getTotalOfMonth(){
    totalMonth = 0;
   for (var element in debts) {
     totalMonth+=element.getCurrentInstallment().value;
   }
   return totalMonth;
  }
  getStatus(){
    DateTime now = DateTime.now();
    if(lastPaid.month == (now.month-1==0?12:now.month-1)&&now.day<invoiceClosingDay){
      status = Status.paid;
      return;
    }
    if(lastPaid.month == (now.month-1==0?12:now.month-1)&&now.day>invoiceClosingDay){
      status = Status.late;
      return;
    }
    status = Status.open;
  }
}
