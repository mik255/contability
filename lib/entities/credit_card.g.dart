// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// CacheGenerator
// **************************************************************************

class CreditCardGen {
  List<CreditCard> getList(String key) {
    List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];
    List<CreditCard> list = dataListFromdb
        .map((e) => CreditCard.fromJson(e))
        .toList();
    return list;
  }
}
