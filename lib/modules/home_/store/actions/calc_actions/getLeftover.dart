



import '../../../../../entities/credit_card.dart';
import '../../../../../entities/errorModel.dart';
import '../../../../../entities/user.dart';
import '../../reduce/debit_register_store.dart';
import '../../states/failed_state.dart';
import '../../states/home_abstract_main_state.dart';
import '../../states/sucess_state.dart';
import 'getTotal.dart';

HomeStoreState getLeftOver(List<CreditCard> list)  {
  try {
    HomeSuccessRegisterState state = getTotal(list) as HomeSuccessRegisterState;
    double leftover =state.total;

    return DebitRegisterStore.homeSuccessRegisterState..leftover = User.salary - leftover;
  } catch (e, _) {
    print(e);
    print(_);
    return HomeFailedRegisterState(
        errorModel: ErrorModel(msg: 'get total error'));
  }
}