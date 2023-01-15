


import '../../../entities/credit_card.dart';
import '../../../entities/errorModel.dart';

class HomeState {}
class HomeData extends HomeState{
  List<CreditCard> items;
  double total;
  double leftover;
  String motivationalPhrase;
  HomeData({
    required this.items,
    required this.total,
    required this.leftover,
    required this.motivationalPhrase,
  });
}
class HomeLoading extends HomeState{}
class HomeFailed extends HomeState{
  HomeFailed({required this.errorModel});
  ErrorModel errorModel;
}
