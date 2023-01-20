



import '../../../../../entities/credit_card.dart';
import '../../../../../entities/errorModel.dart';
import '../../reduce/debit_register_store.dart';
import '../../states/failed_state.dart';
import '../../states/home_abstract_main_state.dart';
import '../../states/sucess_state.dart';

HomeStoreState getTotal(List<CreditCard> list)  {
  try {
    double total =0;
    for (var element in list) {
      total+= element.getTotalOfMonthDebts();
    }
    return DebitRegisterStore.homeSuccessRegisterState..total = total;
  } catch (e, _) {
    print(e);
    print(_);
    return HomeFailedRegisterState(
        errorModel: ErrorModel(msg: 'get total error'));
  }
}