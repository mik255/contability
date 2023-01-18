import 'package:contability/core/cache_abstract.dart';
import 'package:contability/entities/debt.dart';
import 'package:contability/entities/errorModel.dart';

import '../../../entities/credit_card.dart';
import '../../../main_stances.dart';
import '../states/failed_state.dart';
import '../states/loading_state.dart';
import '../states/main_state.dart';
import '../states/sucess_state.dart';

registerOnDB(DebitStoreState value, CreditCard creditCard, Debt debt) async {
  Cache<CreditCard> cache = Cache<CreditCard>();
  value = DebitLoadingRegisterState();
  try {
    cache.addItemToList('creditCardList', creditCard);
    value = DebitSuccessRegisterState();
  } catch (e, _) {
    print(e);
    print(_);
    value = DebitFailedRegisterState(
        errorModel: ErrorModel(msg: 'erro ao salvar '));
  }
}
