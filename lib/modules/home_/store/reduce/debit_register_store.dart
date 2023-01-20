import 'package:flutter/cupertino.dart';
import '../../../../entities/credit_card.dart';
import '../../../../entities/debt.dart';
import '../actions/card_credit_actions/delete_on_db.dart';
import '../actions/card_credit_actions/get_all_credit_card.dart';
import '../actions/card_credit_actions/register_on_db.dart';
import '../actions/card_credit_actions/update_on_db.dart';
import '../states/loading_state.dart';
import '../states/home_abstract_main_state.dart';
import '../states/sucess_state.dart';

class DebitRegisterStore extends ValueNotifier<HomeStoreState> {
  DebitRegisterStore(super.value);

  static HomeSuccessRegisterState homeSuccessRegisterState =
      HomeSuccessRegisterState(
    creditCardList: [],
    total: 0,
    leftover: 0,
  );
  List<CreditCard> creditCardList = [];

  registerEvent(CreditCard creditCard, Debt debt) async {
    value = HomeLoadingRegisterState();
    value = registerOnDB(creditCard, debt);
    _updateList();
  }

  updateEvent(CreditCard creditCard, Debt debt) {
    value = HomeLoadingRegisterState();
    value = updateOnDB(
      creditCard,
      debt,
    );
    _updateList();
  }

  deleteEvent(CreditCard creditCard, Debt debt) {
    value = HomeLoadingRegisterState();
    value = deleteOnDB(
      creditCard,
      debt,
    );
    _updateList();
  }

  void getCreditCardListEvent() {
    value = HomeLoadingRegisterState();
    value = getAllCreditCard();
    _updateList();
  }

  _updateList() {
    if (value is HomeSuccessRegisterState) {
      creditCardList = (value as HomeSuccessRegisterState).creditCardList;
    }
  }
}
