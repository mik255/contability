// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// CacheGenerator
// **************************************************************************

class CreditCardGen {
  List<CreditCard> getList(String key) {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      List<CreditCard> list =
          dataListFromdb.map((e) => CreditCard.fromJson(e)).toList();
      return list;
    } catch (e, _) {
      rethrow;
    }
  }

//add item to list
  addItemToList(String key, CreditCard t) async {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      dataListFromdb.add(t.toJson());
      MainStances.prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      rethrow;
    }
  }

//update item list
  updateItemList(String key, CreditCard t) async {
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
  deleteItemList(String key, CreditCard t) async {
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
