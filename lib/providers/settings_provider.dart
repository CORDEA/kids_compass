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
  }) = _SettingsState;
}

@Riverpod(keepAlive: true, dependencies: [preferencesRepository])
class Settings extends _$Settings {
  @override
  SettingsState build() {
    final repository = ref.watch(preferencesRepositoryProvider);
    Future.wait([repository.isHiragana, repository.isMapMode]).then((values) {
      state = SettingsState(isHiragana: values[0], isMapMode: values[1]);
    });
    return const SettingsState();
  }

  Future<void> setIsHiragana(bool value) async {
    await ref.read(preferencesRepositoryProvider).setIsHiragana(value);
    state = state.copyWith(isHiragana: value);
  }

  Future<void> setIsMapMode(bool value) async {
    await ref.read(preferencesRepositoryProvider).setIsMapMode(value);
    state = state.copyWith(isMapMode: value);
  }
}
