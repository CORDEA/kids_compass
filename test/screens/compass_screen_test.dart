import 'package:compass/screens/compass_screen.dart';
import 'package:compass/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../setup.dart';

void main() {
  late SharedPreferences prefs;

  setUp(() async {
    prefs = await setupMockPreferences();
  });

  testWidgets('shows app title', (tester) async {
    await tester.pumpWidget(
      buildTestApp(child: const CompassScreen(), prefs: prefs),
    );
    await tester.pump();

    expect(find.text('コンパス'), findsOneWidget);
  });

  testWidgets('shows settings button', (tester) async {
    await tester.pumpWidget(
      buildTestApp(child: const CompassScreen(), prefs: prefs),
    );
    await tester.pump();

    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  testWidgets('shows person mode toggle label by default', (tester) async {
    await tester.pumpWidget(
      buildTestApp(child: const CompassScreen(), prefs: prefs),
    );
    await tester.pump();

    // Default isHiragana = true
    expect(find.text('じぶんの むき'), findsOneWidget);
    expect(find.text('ちずと あわせる'), findsOneWidget);
  });

  testWidgets('tapping settings button navigates to settings screen',
      (tester) async {
    await tester.pumpWidget(
      buildTestApp(child: const CompassScreen(), prefs: prefs),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    expect(find.byType(SettingsScreen), findsOneWidget);
  });
}
