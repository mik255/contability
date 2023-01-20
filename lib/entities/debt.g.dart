// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt.dart';

// **************************************************************************
// CacheGenerator
// **************************************************************************

class DebtGen {
  List<Debt> getList(String key) {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      List<Debt> list = dataListFromdb.map((e) => Debt.fromJson(e)).toList();
      return list;
    } catch (e, _) {
      rethrow;
    }
  }

//add item to list
  addItemToList(String key, Debt t) async {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      dataListFromdb.add(t.toJson());
      MainStances.prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      rethrow;
    }
  }

//update item list
  updateItemList(String key, Debt t) async {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      dataListFromdb
          .removeWhere((element) => t.id == json.decode(element)["id"]);
      dataListFromdb.add(t.toJson());
      MainStances.prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      rethrow;
    }
  }

//delete item list
  deleteItemList(String key, Debt t) async {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      dataListFromdb
          .removeWhere((element) => t.id == json.decode(element)["id"]);
      MainStances.prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      rethrow;
    }
  }
}
