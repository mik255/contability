

import 'core/shared_preferences.dart';

class MainStances{
  static late PreferenceUtils prefs;
  static init()async{
    prefs = await PreferenceUtils().init();
  }

}