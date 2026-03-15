import 'package:compass/providers/preferences_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.freezed.dart';
part 'settings_provider.g.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(true) bool isHiragana,
    @Default(false) bool isMapMode,
    @Default(false) bool locationEnabled,
  }) = _SettingsState;
}

@Riverpod(keepAlive: true, dependencies: [preferencesRepository])
class Settings extends _$Settings {
  @override
  SettingsState build() {
    final preferencesRepository = ref.watch(
      preferencesRepositoryProvider,
    );
    return SettingsState(
      isHiragana: preferencesRepository.isHiragana,
      isMapMode: preferencesRepository.isMapMode,
      locationEnabled: preferencesRepository.locationEnabled,
    );
  }

  Future<void> setIsHiragana(bool value) async {
    await ref.read(preferencesRepositoryProvider).setIsHiragana(value);
    state = state.copyWith(isHiragana: value);
  }

  Future<void> setIsMapMode(bool value) async {
    await ref.read(preferencesRepositoryProvider).setIsMapMode(value);
    state = state.copyWith(isMapMode: value);
  }

  Future<void> setLocationEnabled(bool value) async {
    await ref.read(preferencesRepositoryProvider).setLocationEnabled(value);
    state = state.copyWith(locationEnabled: value);
  }
}
