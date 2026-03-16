import 'package:flutter/material.dart';

class AppSegmentedControl extends StatelessWidget {
  const AppSegmentedControl({super.key, required this.segments});

  final List<AppSegment> segments;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: ShapeDecoration(
        color: colors.surfaceContainerLow,
        shape: const StadiumBorder(),
      ),
      child: Row(
        children: segments
            .map((s) => Expanded(child: _Segment(segment: s)))
            .toList(),
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({required this.segment});

  final AppSegment segment;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final color = segment.selected
        ? colors.onPrimaryContainer
        : colors.onSurfaceVariant;
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: ShapeDecoration(
              color: segment.selected
                  ? colors.surfaceContainerLowest
                  : Colors.transparent,
              shape: const StadiumBorder(),
              shadows: segment.selected
                  ? [
                      BoxShadow(
                        color: Colors.black.withAlpha(20),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: segment.onTap,
            customBorder: const StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (segment.icon != null) ...[
                    Icon(segment.icon, size: 18, color: color),
                    const SizedBox(width: 6),
                  ],
                  Flexible(
                    child: Text(
                      segment.label,
                      style: textTheme.titleSmall?.copyWith(
                        color: color,
                        fontWeight: segment.selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppSegment {
  const AppSegment({
    this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData? icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
}
