import 'package:compass/l10n/app_strings.dart';
import 'package:compass/providers/compass_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cardinal_direction_provider.g.dart';

/// The eight principal compass directions in clockwise order.
enum CardinalDirection {
  north,
  northEast,
  east,
  southEast,
  south,
  southWest,
  west,
  northWest;

  /// Returns the localised label for this direction.
  String toLocalizedString(AppStrings strings) {
    switch (this) {
      case CardinalDirection.north:
        return strings.directionNorth;
      case CardinalDirection.northEast:
        return strings.directionNorthEast;
      case CardinalDirection.east:
        return strings.directionEast;
      case CardinalDirection.southEast:
        return strings.directionSouthEast;
      case CardinalDirection.south:
        return strings.directionSouth;
      case CardinalDirection.southWest:
        return strings.directionSouthWest;
      case CardinalDirection.west:
        return strings.directionWest;
      case CardinalDirection.northWest:
        return strings.directionNorthWest;
    }
  }
}

/// Derives the current [CardinalDirection] from [compassHeadingProvider].
@Riverpod(dependencies: [compassHeading])
CardinalDirection cardinalDirection(Ref ref) {
  final heading = ref.watch(compassHeadingProvider).value ?? 0.0;
  final normalized = ((heading % 360) + 360) % 360;
  if (normalized < 22.5 || normalized >= 337.5) return CardinalDirection.north;
  if (normalized < 67.5) return CardinalDirection.northEast;
  if (normalized < 112.5) return CardinalDirection.east;
  if (normalized < 157.5) return CardinalDirection.southEast;
  if (normalized < 202.5) return CardinalDirection.south;
  if (normalized < 247.5) return CardinalDirection.southWest;
  if (normalized < 292.5) return CardinalDirection.west;
  return CardinalDirection.northWest;
}
