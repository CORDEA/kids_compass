import 'package:compass/hooks/use_animated_angle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestWidget extends HookWidget {
  const _TestWidget({required this.targetAngle, required this.onAngle});

  final double targetAngle;
  final void Function(double) onAngle;

  @override
  Widget build(BuildContext context) {
    final angle = useAnimatedAngle(targetAngle);
    onAngle(angle);
    return const SizedBox();
  }
}

void main() {
  group('useAnimatedAngle', () {
    testWidgets('returns initial angle without animating', (tester) async {
      double? reported;
      await tester.pumpWidget(
        _TestWidget(targetAngle: 45.0, onAngle: (a) => reported = a),
      );
      expect(reported, 45.0);
    });

    testWidgets('returns updated angle after target changes', (tester) async {
      double? reported;

      await tester.pumpWidget(
        _TestWidget(targetAngle: 0.0, onAngle: (a) => reported = a),
      );
      expect(reported, 0.0);

      await tester.pumpWidget(
        _TestWidget(targetAngle: 90.0, onAngle: (a) => reported = a),
      );
      // Animation is running — angle is between 0 and 90.
      expect(reported, greaterThanOrEqualTo(0.0));
      expect(reported, lessThanOrEqualTo(90.0));

      await tester.pumpAndSettle();
      expect(reported, 90.0);
    });

    testWidgets('takes shortest path across 0/360 boundary', (tester) async {
      final angles = <double>[];

      await tester.pumpWidget(
        _TestWidget(targetAngle: 350.0, onAngle: angles.add),
      );
      angles.clear();

      await tester.pumpWidget(
        _TestWidget(targetAngle: 10.0, onAngle: angles.add),
      );
      await tester.pumpAndSettle();

      // Shortest path from 350→10 is +20°, so final accumulated angle is 370.
      expect(angles.last, 370.0);
    });
  });
}
