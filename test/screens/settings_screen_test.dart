import 'package:compass/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../setup.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('shows settings title', (tester) async {
    await tester.pumpWidget(buildTestApp(child: const SettingsScreen()));
    await tester.pump();

    // Default isHiragana = true
    expect(find.text('せってい'), findsOneWidget);
  });

  testWidgets('shows back button', (tester) async {
    await tester.pumpWidget(buildTestApp(child: const SettingsScreen()));
    await tester.pump();

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('shows language toggle options', (tester) async {
    await tester.pumpWidget(buildTestApp(child: const SettingsScreen()));
    await tester.pump();

    expect(find.text('ひらがな'), findsOneWidget);
    expect(find.text('漢字'), findsOneWidget);
  });

  testWidgets('tapping 漢字 switches labels to kanji', (tester) async {
    await tester.pumpWidget(buildTestApp(child: const SettingsScreen()));
    await tester.pump();

    await tester.tap(find.text('漢字'));
    await tester.pump();

    expect(find.text('設定'), findsOneWidget);
  });

  testWidgets('shows location and licenses items', (tester) async {
    await tester.pumpWidget(buildTestApp(child: const SettingsScreen()));
    await tester.pump();

    expect(find.byIcon(Icons.location_on), findsOneWidget);
    expect(find.byIcon(Icons.description_outlined), findsOneWidget);
  });
}
