import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharePreferences {
  SharedPreferences? prefs;

  init() async {
    prefs = prefs ?? await SharedPreferences.getInstance();
  }

  Future setData(String key, String value) async {
    await prefs?.setString(key, value);
  }

  getData(String key) {
    return prefs?.getString(key);
  }
}
