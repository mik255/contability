import 'package:contability/entities/debt.dart';
import 'package:contability/entities/errorModel.dart';
import '../../../entities/credit_card.dart';
import '../../../main_stances.dart';
import '../states/failed_state.dart';
import '../states/loading_state.dart';
import '../states/main_state.dart';
import '../states/sucess_state.dart';

updateOnDB(
    DebitStoreState value, CreditCard cardSelected, Debt debtSelect) async {
  value = DebitLoadingRegisterState();
  try {
    List<String> dataListFromdb =
        MainStances.prefs.getStringList('creditCardList') ?? [];
    List<CreditCard> creditCardList =
        dataListFromdb.map((e) => CreditCard.fromJson(e)).toList();
    CreditCard creditCard =
        creditCardList.firstWhere((element) => element.id == cardSelected.id);
    creditCard.debts.removeWhere((element) => element.id == debtSelect.id);
    creditCard.debts.add(debtSelect);
    List<String> dataList = creditCardList.map((e) => e.toJson()).toList();
    MainStances.prefs.setStringList('creditCardList', dataList);
    value = DebitSuccessRegisterState();
  } catch (e, _) {
    print(e);
    print(_);
    value = DebitFailedRegisterState(
        errorModel: ErrorModel(msg: 'erro ao atualizar '));
  }
}
