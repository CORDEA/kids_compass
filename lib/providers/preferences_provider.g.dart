// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  const SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: const <ProviderOrFamily>[],
        $allTransitiveDependencies: const <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'1a6d0623239b50eded24168d3e9e4ae28b7f6acf';

@ProviderFor(preferencesRepository)
const preferencesRepositoryProvider = PreferencesRepositoryProvider._();

final class PreferencesRepositoryProvider
    extends
        $FunctionalProvider<
          PreferencesRepository,
          PreferencesRepository,
          PreferencesRepository
        >
    with $Provider<PreferencesRepository> {
  const PreferencesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferencesRepositoryProvider',
        isAutoDispose: false,
        dependencies: const <ProviderOrFamily>[sharedPreferencesProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          PreferencesRepositoryProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = sharedPreferencesProvider;

  @override
  String debugGetCreateSourceHash() => _$preferencesRepositoryHash();

  @$internal
  @override
  $ProviderElement<PreferencesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PreferencesRepository create(Ref ref) {
    return preferencesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PreferencesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PreferencesRepository>(value),
    );
  }
}

String _$preferencesRepositoryHash() =>
    r'754f06ad4d03e1179a2c43c0a020b73d60d0d8cb';
