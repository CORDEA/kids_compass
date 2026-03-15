import 'package:flutter/animation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Returns the current animated angle (degrees) toward [targetAngle],
/// always taking the shortest rotational path.
///
/// On each [targetAngle] change the hook starts a 300 ms ease-out animation
/// from the previous accumulated angle. [useListenable] on the controller
/// causes the calling widget to rebuild every frame while animating.
double useAnimatedAngle(double targetAngle) {
  final controller = useAnimationController(
    duration: const Duration(milliseconds: 300),
  );
  final currentAngle = useRef(targetAngle);
  final animationRef = useRef<Animation<double>>(
    AlwaysStoppedAnimation(targetAngle),
  );

  useListenable(controller);

  useValueChanged<double, void>(targetAngle, (_, _) {
    var delta = (targetAngle - currentAngle.value) % 360.0;
    if (delta > 180) delta -= 360;
    if (delta < -180) delta += 360;
    final target = currentAngle.value + delta;
    animationRef.value = Tween<double>(
      begin: currentAngle.value,
      end: target,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    controller.forward(from: 0);
    currentAngle.value = target;
  });

  return animationRef.value.value;
}
