import 'package:contability/entities/errorModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/cache_abstract.dart';
import '../../../entities/credit_card.dart';
import '../states/failed_state.dart';
import '../states/loading_state.dart';
import '../states/main_state.dart';
import '../states/sucess_state.dart';

getOnDb(
    DebitStoreState value,SharedPreferences prefs) async {
  value = DebitLoadingRegisterState();
  try {
    Cache<CreditCard> cache = Cache<CreditCard>(prefs);
    List<CreditCard> list = cache.getList('creditCardList')??[];
    value = DebitSuccessRegisterState(
        creditCardList:list
    );
  } catch (e, _) {
    print(e);
    print(_);
    value = DebitFailedRegisterState(
        errorModel: ErrorModel(msg: 'erro ao deletar '));
    rethrow;
  }
}
