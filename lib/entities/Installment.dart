

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
}
