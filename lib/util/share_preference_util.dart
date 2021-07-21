/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    share_preference_util
 * 创建时间:  2019/1/30 on 2:36 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class SharedPreferencesUtil {
  static SharedPreferencesUtil? _singleton;
  static late SharedPreferences _prefs;

  static SharedPreferences? get prefs => _prefs;
  static Lock _lock = Lock();

  static Future<SharedPreferencesUtil?> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          var singleton = SharedPreferencesUtil._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }
    return _singleton;
  }

  SharedPreferencesUtil._();

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static Future<bool>? putString(String key, String value) {
    return _prefs.setString(key, value);
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key) == null ? false : _prefs.getBool(key);
  }

  static Future<bool> putBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static Future<bool> putInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  static Future<bool> putDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  static Future<bool> putStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  static dynamic getDynamic(String key) {
    return _prefs.get(key);
  }

  static Set<String> getKeys() {
    return _prefs.getKeys();
  }

  static Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  static Future<bool> clear() {
    return _prefs.clear();
  }
}
