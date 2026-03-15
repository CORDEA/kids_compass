import 'package:shared_preferences/shared_preferences.dart';

abstract interface class PreferencesRepository {
  bool get isHiragana;
  bool get isMapMode;
  bool get locationEnabled;
  Future<void> setIsHiragana(bool value);
  Future<void> setIsMapMode(bool value);
  Future<void> setLocationEnabled(bool value);
}

final class SharedPreferencesRepository implements PreferencesRepository {
  const SharedPreferencesRepository(this._preferences);

  static const String _keyIsHiragana = 'isHiragana';
  static const String _keyIsMapMode = 'isMapMode';
  static const String _keyLocationEnabled = 'locationEnabled';

  final SharedPreferences _preferences;

  @override
  bool get isHiragana => _preferences.getBool(_keyIsHiragana) ?? true;

  @override
  bool get isMapMode => _preferences.getBool(_keyIsMapMode) ?? false;

  @override
  bool get locationEnabled =>
      _preferences.getBool(_keyLocationEnabled) ?? false;

  @override
  Future<void> setIsHiragana(bool value) =>
      _preferences.setBool(_keyIsHiragana, value);

  @override
  Future<void> setIsMapMode(bool value) =>
      _preferences.setBool(_keyIsMapMode, value);

  @override
  Future<void> setLocationEnabled(bool value) =>
      _preferences.setBool(_keyLocationEnabled, value);
}
