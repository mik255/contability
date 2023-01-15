import 'package:contability/modules/home/store/states.dart';
import 'package:flutter/foundation.dart';
import 'functions/get_data_from_db.dart';
class HomeStore extends ValueNotifier<HomeState> {
  HomeStore(super.value);

  void getDataFromDbEvent() async {
    getDataFromDb(value);
  }

}
