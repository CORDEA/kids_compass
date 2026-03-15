import 'package:compass/repositories/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
SharedPreferences sharedPreferences(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true, dependencies: [sharedPreferences])
PreferencesRepository preferencesRepository(Ref ref) =>
    SharedPreferencesRepository(ref.watch(sharedPreferencesProvider));
