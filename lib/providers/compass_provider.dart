import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'compass_provider.g.dart';

@Riverpod(dependencies: [])
Stream<double> compassHeading(Ref ref) {
  const channel = EventChannel('jp.cordea.kids.compass/heading');
  return channel.receiveBroadcastStream().map(
    (dynamic value) => (value as num).toDouble(),
  );
}
