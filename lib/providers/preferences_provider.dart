import 'package:compass/repositories/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preferences_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
PreferencesRepository preferencesRepository(Ref ref) =>
    SharedPreferencesRepository();
