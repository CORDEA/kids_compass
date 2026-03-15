// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compass_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(compassHeading)
const compassHeadingProvider = CompassHeadingProvider._();

final class CompassHeadingProvider
    extends $FunctionalProvider<AsyncValue<double>, double, Stream<double>>
    with $FutureModifier<double>, $StreamProvider<double> {
  const CompassHeadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'compassHeadingProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[],
        $allTransitiveDependencies: const <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$compassHeadingHash();

  @$internal
  @override
  $StreamProviderElement<double> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<double> create(Ref ref) {
    return compassHeading(ref);
  }
}

String _$compassHeadingHash() => r'670fd6f6ba54bb9f07cbe67af190ca6e83fcdc51';
