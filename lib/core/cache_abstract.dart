


import 'dart:convert';

import '../main_stances.dart';

class Cache<T>{
  List<T> getList(String key){
    List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
    List<T> list = dataListFromdb.map((e) => (T as dynamic).fromJson(e) as T).toList();
    return list;
  }
  addItemToList(String key,T t) async {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      dataListFromdb.add((t as dynamic).toJson());
      MainStances.prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      print(e);
      print(_);
      rethrow;
    }
  }

  updateItemList(String key,T t) async {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      dataListFromdb.removeWhere((element) => (t as dynamic).id == json.decode(element).id);
      dataListFromdb.add((t as dynamic).toJson());
      MainStances.prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      print(e);
      print(_);
      rethrow;
    }
  }
  deleteItemList(String key,T t) async {
    try {
      List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
      dataListFromdb.removeWhere((element) => (t as dynamic).id == json.decode(element).id);
      MainStances.prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      print(e);
      print(_);
      rethrow;
    }
  }
  
}