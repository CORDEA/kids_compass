// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardinal_direction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Derives the current [CardinalDirection] from [compassHeadingProvider].

@ProviderFor(cardinalDirection)
const cardinalDirectionProvider = CardinalDirectionProvider._();

/// Derives the current [CardinalDirection] from [compassHeadingProvider].

final class CardinalDirectionProvider
    extends
        $FunctionalProvider<
          CardinalDirection,
          CardinalDirection,
          CardinalDirection
        >
    with $Provider<CardinalDirection> {
  /// Derives the current [CardinalDirection] from [compassHeadingProvider].
  const CardinalDirectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardinalDirectionProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[compassHeadingProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          CardinalDirectionProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = compassHeadingProvider;

  @override
  String debugGetCreateSourceHash() => _$cardinalDirectionHash();

  @$internal
  @override
  $ProviderElement<CardinalDirection> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CardinalDirection create(Ref ref) {
    return cardinalDirection(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CardinalDirection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CardinalDirection>(value),
    );
  }
}

String _$cardinalDirectionHash() => r'6ef42989e09441e3ca457fb07d352b9a056f537b';
