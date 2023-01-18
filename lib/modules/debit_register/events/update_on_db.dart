import 'package:contability/entities/debt.dart';
import 'package:contability/entities/errorModel.dart';
import '../../../core/cache_abstract.dart';
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
    Cache<CreditCard> cache = Cache<CreditCard>();
    cache.updateItemList('creditCardList', cardSelected);
    value = DebitSuccessRegisterState();
  } catch (e, _) {
    print(e);
    print(_);
    value = DebitFailedRegisterState(
        errorModel: ErrorModel(msg: 'erro ao atualizar '));
  }
}
