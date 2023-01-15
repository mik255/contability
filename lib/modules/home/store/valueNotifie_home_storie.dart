


import 'package:contability/entities/credit_card.dart';
import 'package:contability/main_stances.dart';
import 'package:contability/modules/home/store/states.dart';
import 'package:flutter/cupertino.dart';

import '../../../entities/user.dart';

class HomeStore extends ValueNotifier<HomeState>{
  HomeStore(super.value);

  void getDataFromDb()async{
    List<String> dataList = MainStances.prefs.getStringList('credtCardList')!;
   List<CreditCard> credtCardList = dataList.map((e) => CreditCard.fromJsonEncodedString(e)).toList();
   double totalMonth = 0;
    for (var element in credtCardList) {
      totalMonth+= element.getTotalOfMonth();
    }
   value = HomeData(
     items:  credtCardList,
     total:totalMonth,
     leftover: totalMonth - User.salary,
     motivationalPhrase: '“Se você quer ser bem sucedido, precisa ter dedicação total, buscar seu último limite e dar o melhor de si.” Ayrton Senna',
   );
  }
}