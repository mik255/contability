import 'package:contability/entities/debt.dart';
import 'package:contability/entities/errorModel.dart';

import '../../../entities/credit_card.dart';
import '../../../main_stances.dart';
import '../states/failed_state.dart';
import '../states/loading_state.dart';
import '../states/main_state.dart';
import '../states/sucess_state.dart';

registerOnDB(DebitStoreState value, CreditCard creditCard, Debt debt) async {
  value = DebitLoadingRegisterState();
  try {
    List<String> dataListFromdb =
        MainStances.prefs.getStringList('creditCardList') ?? [];
    List<CreditCard> creditCardList =
        dataListFromdb.map((e) => CreditCard.fromJson(e)).toList();
    creditCard.debts.add(debt);
    List<String> dataList = creditCardList.map((e) => e.toJson()).toList();
    MainStances.prefs.setStringList('creditCardList', dataList);
    value = DebitSuccessRegisterState();
  } catch (e, _) {
    print(e);
    print(_);
    value = DebitFailedRegisterState(
        errorModel: ErrorModel(msg: 'erro ao salvar '));
  }
}
