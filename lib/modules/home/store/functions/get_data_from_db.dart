import 'package:flutter/foundation.dart';
import '../../../../entities/credit_card.dart';
import '../../../../entities/errorModel.dart';
import '../../../../entities/user.dart';
import '../../../../main_stances.dart';
import '../states.dart';

void getDataFromDb(HomeState value) async {
  value = HomeLoading();
  try {
    await compute(getDataFromDbCompute,value);
  } catch (e, _) {
    if (kDebugMode) {
      print(e);
      print(_);
    }
    value =
        HomeFailed(errorModel: ErrorModel(msg: 'Erro ao trazer os dados'));
  }
}
getDataFromDbCompute(HomeState value) async{
  List<String> dataList = MainStances.prefs.getStringList('creditCardList')??[];
  List<CreditCard> creditCardList = dataList.map((e) => CreditCard.fromJson(e)).toList();
  double totalMonth = 0;
  for (var element in creditCardList) {
    totalMonth += element.getTotalOfMonthDebts();
  }
  value = HomeData(
    items: creditCardList,
    total: totalMonth,
    leftover: totalMonth - User.salary,
    motivationalPhrase:
    '“Se você quer ser bem sucedido, precisa ter dedicação total, buscar seu último limite e dar o melhor de si.” Ayrton Senna',
  );
}