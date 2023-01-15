import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  late SharedPreferences prefs;
  Future<PreferenceUtils> init()async{
     prefs = await SharedPreferences.getInstance();
     return this;
  }
  String? getString(String key){
     String? value = prefs.getString(key);
     return value;
  }
  int? getInt(String key){
    int? value = prefs.getInt(key);
    return value;
  }
  bool? getBool(String key){
    bool? value = prefs.getBool(key);
    return value;
  }
  double? getDouble(String key){
    double? value = prefs.getDouble(key);
    return value;
  }
  List<String>? getStringList(String key){
    List<String>? value = prefs.getStringList(key);
    return value;
  }

  void setString(String key,value)async{
    await prefs.setString(key,value);
  }
  void setInt(String key,value)async{
    await prefs.setInt(key,value);
  }
  void setBool(String key,value)async{
    await prefs.setBool(key,value);
  }
  void setDouble(String key,value)async{
    await prefs.setDouble(key,value);
  }
  void setStringList(String key,List<String> value)async{
    await prefs.setStringList(key,value);
  }
}