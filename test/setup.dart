import 'package:compass/l10n/app_localizations.dart';
import 'package:compass/providers/compass_provider.dart';
import 'package:compass/providers/package_info_provider.dart';
import 'package:compass/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

Widget buildTestApp({required Widget child}) {
  return ProviderScope(
    overrides: [
      compassHeadingProvider.overrideWith((ref) => Stream.value(0.0)),
      packageInfoProvider.overrideWith(
        (_) async => PackageInfo(
          appName: 'コンパス',
          packageName: 'jp.cordea.compass',
          version: '1.0.0',
          buildNumber: '1',
        ),
      ),
    ],
    child: MaterialApp(
      theme: AppTheme.light(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    ),
  );
}
