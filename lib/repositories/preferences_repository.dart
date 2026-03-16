import 'package:shared_preferences/shared_preferences.dart';

abstract interface class PreferencesRepository {
  Future<bool> get isHiragana;
  Future<bool> get isMapMode;
  Future<void> setIsHiragana(bool value);
  Future<void> setIsMapMode(bool value);
}

final class SharedPreferencesRepository implements PreferencesRepository {
  const SharedPreferencesRepository();

  static const String _keyIsHiragana = 'isHiragana';
  static const String _keyIsMapMode = 'isMapMode';

  Future<SharedPreferences> get _preferences => SharedPreferences.getInstance();

  @override
  Future<bool> get isHiragana =>
      _preferences.then((prefs) => prefs.getBool(_keyIsHiragana) ?? true);

  @override
  Future<bool> get isMapMode =>
      _preferences.then((prefs) => prefs.getBool(_keyIsMapMode) ?? false);

  @override
  Future<void> setIsHiragana(bool value) =>
      _preferences.then((prefs) => prefs.setBool(_keyIsHiragana, value));

  @override
  Future<void> setIsMapMode(bool value) =>
      _preferences.then((prefs) => prefs.setBool(_keyIsMapMode, value));
}
