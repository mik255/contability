import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Cache<T> {
  Cache(this.prefs);

  SharedPreferences prefs;

  List<T> getList(String key) {
    List<String> dataListFromdb = prefs.getStringList(key) ?? [];
    List<T> list = dataListFromdb.map((e) => (T as dynamic).fromJson(e) as T).toList();
    return list;
  }

  addItemToList(String key, T t) async {
    try {
      (t as dynamic).id = t.hashCode.toString();
      List<String> dataListFromdb = prefs.getStringList(key) ?? [];
      dataListFromdb.add((t as dynamic).toJson());
      prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      print(e);
      print(_);
      rethrow;
    }
  }

  updateItemList(String key, T t) async {
    try {
      List<String> dataListFromdb = prefs.getStringList(key) ?? [];
      dataListFromdb.removeWhere((element) => (t as dynamic).id == json.decode(element).id);
      dataListFromdb.add((t as dynamic).toJson());
      prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      print(e);
      print(_);
      rethrow;
    }
  }

  deleteItemList(String key, T t) async {
    try {
      List<String> dataListFromdb = prefs.getStringList(key) ?? [];
      dataListFromdb.removeWhere((element) => (t as dynamic).id == json.decode(element).id);
      prefs.setStringList(key, dataListFromdb);
    } catch (e, _) {
      print(e);
      print(_);
      rethrow;
    }
  }
}


