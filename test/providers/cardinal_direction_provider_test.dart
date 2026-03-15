import 'dart:async';

import 'package:compass/providers/cardinal_direction_provider.dart';
import 'package:compass/providers/compass_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

ProviderContainer makeContainer(double heading) {
  return ProviderContainer(
    overrides: [
      compassHeadingProvider.overrideWith((ref) {
        final controller = StreamController<double>();
        ref.onDispose(controller.close);
        controller.add(heading);
        return controller.stream;
      }),
    ],
  );
}

void main() {
  group('cardinalDirectionProvider', () {
    const cases = [
      (0.0, CardinalDirection.north),
      (22.4, CardinalDirection.north),
      (22.5, CardinalDirection.northEast),
      (67.4, CardinalDirection.northEast),
      (67.5, CardinalDirection.east),
      (112.4, CardinalDirection.east),
      (112.5, CardinalDirection.southEast),
      (157.4, CardinalDirection.southEast),
      (157.5, CardinalDirection.south),
      (202.4, CardinalDirection.south),
      (202.5, CardinalDirection.southWest),
      (247.4, CardinalDirection.southWest),
      (247.5, CardinalDirection.west),
      (292.4, CardinalDirection.west),
      (292.5, CardinalDirection.northWest),
      (337.4, CardinalDirection.northWest),
      (337.5, CardinalDirection.north),
      (359.9, CardinalDirection.north),
      (360.0, CardinalDirection.north),
      (-1.0, CardinalDirection.north),
      (361.0, CardinalDirection.north),
    ];

    for (final (heading, expected) in cases) {
      test('$heading° → $expected', () async {
        final container = makeContainer(heading);
        addTearDown(container.dispose);

        // Subscribe to keep providers alive during the test.
        container.listen(cardinalDirectionProvider, (_, _) {});

        await container.read(compassHeadingProvider.future);
        expect(container.read(cardinalDirectionProvider), expected);
      });
    }
  });
}
