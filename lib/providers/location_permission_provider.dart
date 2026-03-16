import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_permission_provider.g.dart';

@riverpod
Future<bool> locationPermission(Ref ref) =>
    Permission.locationWhenInUse.isGranted;
