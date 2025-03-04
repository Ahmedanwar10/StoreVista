import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_vista/preesentaion/resources/language_manager.dart';
const String PRES_APP_KEY = 'PRES_APP_LANG';
class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  Future<String>getAppLang() async{
    String ? language = _sharedPreferences.getString(PRES_APP_KEY);
    if(language != null && language.isEmpty){
      return language;
    }else{
     return LanguageType.ENGLISH.getValue();
    }
  }
}
