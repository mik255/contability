import '../../../../../entities/credit_card.dart';
import '../../../../../entities/errorModel.dart';
import '../../reduce/debit_register_store.dart';
import '../../states/failed_state.dart';
import '../../states/home_abstract_main_state.dart';
import '../../states/sucess_state.dart';

HomeStoreState getAllCreditCard() {
  try {
    CreditCardGen cacheModel = CreditCardGen();
    List<CreditCard>? list = cacheModel.getList('creditCardList');
    return DebitRegisterStore.homeSuccessRegisterState..creditCardList = list;
  } catch (e, _) {
    print(e);
    print(_);
    return HomeFailedRegisterState(errorModel: ErrorModel(msg: 'erro ao deletar '));
  }
}
