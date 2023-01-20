import '../../../../entities/credit_card.dart';
import 'home_abstract_main_state.dart';

class HomeSuccessRegisterState extends HomeStoreState {
  HomeSuccessRegisterState({
    required this.creditCardList,
    required this.total,
    required this.leftover,
  });

  List<CreditCard> creditCardList;
  double total;
  double leftover;
}
