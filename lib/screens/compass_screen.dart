import 'dart:math' as math;

import 'package:compass/hooks/use_animated_angle.dart';
import 'package:compass/l10n/app_localizations.dart';
import 'package:compass/l10n/app_strings.dart';
import 'package:compass/providers/cardinal_direction_provider.dart';
import 'package:compass/providers/compass_provider.dart';
import 'package:compass/providers/settings_provider.dart';
import 'package:compass/screens/settings_screen.dart';
import 'package:compass/widgets/compass_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHiragana = ref.watch(settingsProvider.select((s) => s.isHiragana));
    final strings = AppStrings.of(AppLocalizations.of(context)!, isHiragana);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Stack(
        children: [
          Positioned(
            top: -40,
            left: -40,
            child: _BlurCircle(
              size: 240,
              color: colors.primaryFixed.withAlpha(77),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -60,
            child: _BlurCircle(
              size: 300,
              color: colors.tertiaryFixed.withAlpha(51),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _TopBar(
                  onSettings: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const SettingsScreen(),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _CompassArea(strings: strings),
                      const SizedBox(height: 32),
                      _DirectionCard(strings: strings),
                    ],
                  ),
                ),
                _ModeToggle(strings: strings),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onSettings});

  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Icon(Icons.explore, color: colors.primary, size: 26),
          const SizedBox(width: 10),
          Text(
            AppLocalizations.of(context)!.appTitle,
            style: textTheme.headlineMedium?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Material(
            color: colors.primaryFixedDim,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onSettings,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.settings,
                  color: colors.onPrimaryFixed,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompassArea extends ConsumerWidget {
  const _CompassArea({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compassSize = (MediaQuery.sizeOf(context).width * 0.8).clamp(
      0.0,
      320.0,
    );
    return SizedBox.square(
      dimension: compassSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final heading = ref.watch(compassHeadingProvider).value ?? 0.0;
              final isMapMode = ref.watch(
                settingsProvider.select((s) => s.isMapMode),
              );
              return CompassWidget(heading: heading, isMapMode: isMapMode);
            },
          ),
          _OrbitingLabels(strings: strings, compassSize: compassSize),
        ],
      ),
    );
  }
}

class _OrbitingLabels extends HookConsumerWidget {
  const _OrbitingLabels({required this.strings, required this.compassSize});

  final AppStrings strings;
  final double compassSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heading = ref.watch(compassHeadingProvider).value ?? 0.0;
    final isMapMode = ref.watch(settingsProvider.select((s) => s.isMapMode));
    final diskRotation = isMapMode ? 0.0 : -heading;
    final animated = useAnimatedAngle(diskRotation);
    final angle = isMapMode ? 0.0 : animated;

    final labels = [
      (strings.directionNorth, 0.0),
      (strings.directionEast, 90.0),
      (strings.directionSouth, 180.0),
      (strings.directionWest, 270.0),
    ];

    return Stack(
      alignment: Alignment.center,
      children: [
        for (final (label, bearing) in labels)
          _OrbitingLabel(
            label: label,
            bearing: bearing,
            diskAngle: angle,
            compassSize: compassSize,
          ),
      ],
    );
  }
}

class _OrbitingLabel extends StatelessWidget {
  const _OrbitingLabel({
    required this.label,
    required this.bearing,
    required this.diskAngle,
    required this.compassSize,
  });

  final String label;
  final double bearing;
  final double diskAngle;
  final double compassSize;

  static const double _fontSizeMax = 32.0;
  static const double _fontSizeMin = 18.0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final orbitRadius = compassSize * 0.382;
    final screenAngleRad = (bearing + diskAngle) * math.pi / 180.0;
    final x = orbitRadius * math.sin(screenAngleRad);
    final y = -orbitRadius * math.cos(screenAngleRad);
    final proximity = (1.0 + math.cos(screenAngleRad)) / 2.0;
    final fontSize = _fontSizeMin + (_fontSizeMax - _fontSizeMin) * proximity;
    final alpha = (60 + 195 * proximity).round();

    return Transform.translate(
      offset: Offset(x, y),
      child: Text(
        label,
        style: textTheme.headlineMedium?.copyWith(
          color: colors.onSurface.withAlpha(alpha),
          fontWeight: FontWeight.w900,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

class _DirectionCard extends ConsumerWidget {
  const _DirectionCard({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withAlpha(20),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colors.primaryFixedDim.withAlpha(51),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [colors.primary, colors.primaryContainer],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.explore,
                      color: colors.surfaceContainerLowest,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final direction = ref.watch(
                              cardinalDirectionProvider,
                            );
                            return Text(
                              direction.toLocalizedString(strings),
                              style: textTheme.titleMedium?.copyWith(
                                color: colors.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 2),
                        Consumer(
                          builder: (context, ref, child) {
                            final heading =
                                ref.watch(compassHeadingProvider).value ?? 0.0;
                            return Text(
                              strings.headingDegrees(heading),
                              style: textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeToggle extends ConsumerWidget {
  const _ModeToggle({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: ShapeDecoration(
          color: colors.surfaceContainerLow,
          shape: const StadiumBorder(),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final isMapMode = ref.watch(
              settingsProvider.select((s) => s.isMapMode),
            );
            return Row(
              children: [
                _ToggleSegment(
                  icon: Icons.directions_walk,
                  label: strings.modePersonLabel,
                  selected: !isMapMode,
                  onTap: () =>
                      ref.read(settingsProvider.notifier).setIsMapMode(false),
                ),
                _ToggleSegment(
                  icon: Icons.map_outlined,
                  label: strings.modeMapLabel,
                  selected: isMapMode,
                  onTap: () =>
                      ref.read(settingsProvider.notifier).setIsMapMode(true),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ToggleSegment extends StatelessWidget {
  const _ToggleSegment({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: ShapeDecoration(
            color: selected
                ? colors.surfaceContainerLowest
                : Colors.transparent,
            shape: const StadiumBorder(),
            shadows: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: selected
                    ? colors.onPrimaryContainer
                    : colors.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: textTheme.titleSmall?.copyWith(
                    color: selected
                        ? colors.onPrimaryContainer
                        : colors.onSurfaceVariant,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlurCircle extends StatelessWidget {
  const _BlurCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: const SizedBox.shrink(),
    );
  }
}
