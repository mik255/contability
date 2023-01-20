import 'package:contability/entities/debt.dart';
import 'package:contability/entities/errorModel.dart';
import '../../../../../entities/credit_card.dart';
import '../../reduce/debit_register_store.dart';
import '../../states/failed_state.dart';
import '../../states/home_abstract_main_state.dart';
import '../../states/sucess_state.dart';

HomeStoreState registerOnDB(CreditCard creditCard, Debt debt)  {

  try {
    CreditCardGen cacheModel = CreditCardGen();
    cacheModel.addItemToList('creditCardList', creditCard);
    List<CreditCard> list = cacheModel.getList('creditCardList');
    return DebitRegisterStore.homeSuccessRegisterState..creditCardList = list;
  } catch (e, _) {
    print(e);
    print(_);
    return HomeFailedRegisterState(
        errorModel: ErrorModel(msg: 'erro ao salvar '));
  }
}
