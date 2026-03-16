// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Settings)
const settingsProvider = SettingsProvider._();

final class SettingsProvider
    extends $NotifierProvider<Settings, SettingsState> {
  const SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: const <ProviderOrFamily>[preferencesRepositoryProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          SettingsProvider.$allTransitiveDependencies0,
          SettingsProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = preferencesRepositoryProvider;
  static const $allTransitiveDependencies1 =
      PreferencesRepositoryProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  Settings create() => Settings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsState>(value),
    );
  }
}

String _$settingsHash() => r'60462a24a0246696bddf45fcc9daa1021e8c6bc4';

abstract class _$Settings extends $Notifier<SettingsState> {
  SettingsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SettingsState, SettingsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SettingsState, SettingsState>,
              SettingsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
