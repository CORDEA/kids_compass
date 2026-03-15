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
      child: Row(children: segments),
    );
  }
}

class AppSegment extends StatelessWidget {
  const AppSegment({
    super.key,
    this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData? icon;
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
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: ShapeDecoration(
            color: selected ? colors.surfaceContainerLowest : Colors.transparent,
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
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 18,
                  color: selected ? colors.onPrimaryContainer : colors.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
              ],
              Flexible(
                child: Text(
                  label,
                  style: textTheme.titleSmall?.copyWith(
                    color: selected ? colors.onPrimaryContainer : colors.onSurfaceVariant,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
