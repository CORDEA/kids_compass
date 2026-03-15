import 'dart:math' as math;

import 'package:compass/hooks/use_animated_angle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CompassWidget extends StatelessWidget {
  const CompassWidget({
    super.key,
    required this.heading,
    required this.isMapMode,
  });

  final double heading;
  final bool isMapMode;

  @override
  Widget build(BuildContext context) {
    // Needle is always fixed at north (0°). In person mode the entire disk
    // rotates; in map mode both disk and needle are stationary.
    const Widget disk = _CompassDisk(needleHeading: 0);

    if (isMapMode) {
      return disk;
    }

    return _AnimatedCompassRotation(heading: heading, child: disk);
  }
}

class _AnimatedCompassRotation extends HookWidget {
  const _AnimatedCompassRotation({required this.heading, required this.child});

  final double heading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final angle = useAnimatedAngle(-heading);
    return Transform.rotate(angle: angle * math.pi / 180, child: child);
  }
}

class _CompassDisk extends StatelessWidget {
  const _CompassDisk({required this.needleHeading});

  final double needleHeading;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CustomPaint(
      painter: _CompassPainter(colors: colors, needleHeading: needleHeading),
      child: const SizedBox.expand(),
    );
  }
}

class _CompassPainter extends CustomPainter {
  const _CompassPainter({required this.colors, required this.needleHeading});

  final ColorScheme colors;
  final double needleHeading;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final double radius = math.min(cx, cy);

    _drawBezel(canvas, cx, cy, radius);
    _drawDashedRing(canvas, cx, cy, radius * 0.82);
    _drawTickMarks(canvas, cx, cy, radius);
    _drawNeedle(canvas, cx, cy, radius, needleHeading);
  }

  void _drawBezel(Canvas canvas, double cx, double cy, double radius) {
    canvas.drawCircle(
      Offset(cx, cy),
      radius - 2,
      Paint()
        ..color = colors.primary.withAlpha(20)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20),
    );
    canvas.drawCircle(
      Offset(cx, cy),
      radius - 2,
      Paint()
        ..color = colors.surfaceContainerLowest
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      Offset(cx, cy),
      radius * 0.94,
      Paint()
        ..color = colors.surfaceContainerLow
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.12,
    );
  }

  void _drawDashedRing(Canvas canvas, double cx, double cy, double radius) {
    final paint = Paint()
      ..color = colors.outlineVariant.withAlpha(77)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const dashCount = 48;
    const dashAngle = 2 * math.pi / dashCount;
    const gapFraction = 0.4;

    for (var i = 0; i < dashCount; i++) {
      final start = i * dashAngle;
      final sweep = dashAngle * (1 - gapFraction);
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: radius),
        start,
        sweep,
        false,
        paint,
      );
    }
  }

  void _drawTickMarks(Canvas canvas, double cx, double cy, double radius) {
    final majorPaint = Paint()
      ..color = colors.outlineVariant.withAlpha(128)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 8; i++) {
      final angle = i * math.pi / 4 - math.pi / 2;
      final outerR = radius * 0.88;
      final innerR = radius * 0.80;
      canvas.drawLine(
        Offset(cx + outerR * math.cos(angle), cy + outerR * math.sin(angle)),
        Offset(cx + innerR * math.cos(angle), cy + innerR * math.sin(angle)),
        majorPaint,
      );
    }
  }

  void _drawNeedle(
    Canvas canvas,
    double cx,
    double cy,
    double radius,
    double heading,
  ) {
    canvas.save();
    canvas.translate(cx, cy);
    canvas.rotate(heading * math.pi / 180);

    final halfLen = radius * 0.50;
    final halfWidth = radius * 0.05;

    // Red north half
    final northPath = Path()
      ..moveTo(-halfWidth, 0)
      ..lineTo(0, -halfLen)
      ..lineTo(halfWidth, 0)
      ..close();
    canvas.drawPath(
      northPath,
      Paint()
        ..color = colors.tertiary
        ..style = PaintingStyle.fill,
    );
    canvas.drawPath(
      northPath,
      Paint()
        ..color = colors.onTertiaryContainer.withAlpha(60)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );

    // Grey south half
    final southPath = Path()
      ..moveTo(-halfWidth, 0)
      ..lineTo(0, halfLen)
      ..lineTo(halfWidth, 0)
      ..close();
    canvas.drawPath(
      southPath,
      Paint()
        ..color = colors.surfaceDim
        ..style = PaintingStyle.fill,
    );

    // Pivot circle
    final pivotR = radius * 0.07;
    canvas.drawCircle(
      Offset.zero,
      pivotR,
      Paint()
        ..color = colors.surfaceContainerLowest
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      Offset.zero,
      pivotR,
      Paint()
        ..color = colors.surfaceContainer
        ..style = PaintingStyle.stroke
        ..strokeWidth = pivotR * 0.5,
    );
    canvas.drawCircle(
      Offset.zero,
      pivotR * 0.25,
      Paint()
        ..color = colors.onSurfaceVariant
        ..style = PaintingStyle.fill,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(_CompassPainter old) =>
      old.needleHeading != needleHeading || old.colors != colors;
}
