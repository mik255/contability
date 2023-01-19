import '../../../entities/credit_card.dart';
import 'main_state.dart';

class DebitSuccessRegisterState extends DebitStoreState{
  DebitSuccessRegisterState({required this.creditCardList});
  List<CreditCard> creditCardList;
}