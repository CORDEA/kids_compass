// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Compass';

  @override
  String get directionNorthHiragana => 'North';

  @override
  String get directionNorthKanji => 'North';

  @override
  String get directionEastHiragana => 'East';

  @override
  String get directionEastKanji => 'East';

  @override
  String get directionSouthHiragana => 'South';

  @override
  String get directionSouthKanji => 'South';

  @override
  String get directionWestHiragana => 'West';

  @override
  String get directionWestKanji => 'West';

  @override
  String get directionNorthEastHiragana => 'Northeast';

  @override
  String get directionNorthEastKanji => 'Northeast';

  @override
  String get directionNorthWestHiragana => 'Northwest';

  @override
  String get directionNorthWestKanji => 'Northwest';

  @override
  String get directionSouthEastHiragana => 'Southeast';

  @override
  String get directionSouthEastKanji => 'Southeast';

  @override
  String get directionSouthWestHiragana => 'Southwest';

  @override
  String get directionSouthWestKanji => 'Southwest';

  @override
  String get modePersonLabelHiragana => 'Facing me';

  @override
  String get modePersonLabelKanji => 'Facing me';

  @override
  String get modeMapLabelHiragana => 'Match map';

  @override
  String get modeMapLabelKanji => 'Match map';

  @override
  String get settingsTitleHiragana => 'Settings';

  @override
  String get settingsTitleKanji => 'Settings';

  @override
  String get settingsSectionGeneralHiragana => 'General';

  @override
  String get settingsSectionGeneralKanji => 'General';

  @override
  String get settingsLanguageLabelHiragana => 'Language';

  @override
  String get settingsLanguageLabelKanji => 'Language';

  @override
  String get settingsLanguageDescription => 'Choose hiragana or kanji';

  @override
  String get langOptionHiragana => 'Hiragana';

  @override
  String get langOptionKanji => 'Kanji';

  @override
  String get settingsLocationLabelHiragana => 'Location';

  @override
  String get settingsLocationLabelKanji => 'Location';

  @override
  String get settingsLocationDescription =>
      'Turn ON to make the compass more accurate. It also works when OFF, so no worries.';

  @override
  String get settingsSectionAppInfoHiragana => 'App info';

  @override
  String get settingsSectionAppInfoKanji => 'App info';

  @override
  String get settingsLicensesLabelHiragana => 'Open source licenses';

  @override
  String get settingsLicensesLabelKanji => 'Open source licenses';

  @override
  String get settingsLicensesDescription => 'Tools used to build this app';

  @override
  String appVersion(String appName, String version) {
    return '$appName v$version';
  }

  @override
  String headingDegrees(String degrees) {
    return '$degrees°';
  }
}
