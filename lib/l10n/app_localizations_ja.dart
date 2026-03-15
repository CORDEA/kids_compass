// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'コンパス';

  @override
  String get directionNorthHiragana => 'きた';

  @override
  String get directionNorthKanji => '北';

  @override
  String get directionEastHiragana => 'ひがし';

  @override
  String get directionEastKanji => '東';

  @override
  String get directionSouthHiragana => 'みなみ';

  @override
  String get directionSouthKanji => '南';

  @override
  String get directionWestHiragana => 'にし';

  @override
  String get directionWestKanji => '西';

  @override
  String get directionNorthEastHiragana => 'ほくとう';

  @override
  String get directionNorthEastKanji => '北東';

  @override
  String get directionNorthWestHiragana => 'ほくせい';

  @override
  String get directionNorthWestKanji => '北西';

  @override
  String get directionSouthEastHiragana => 'なんとう';

  @override
  String get directionSouthEastKanji => '南東';

  @override
  String get directionSouthWestHiragana => 'なんせい';

  @override
  String get directionSouthWestKanji => '南西';

  @override
  String get modePersonLabelHiragana => 'じぶんの むき';

  @override
  String get modePersonLabelKanji => '自分の向き';

  @override
  String get modeMapLabelHiragana => 'ちずと あわせる';

  @override
  String get modeMapLabelKanji => '地図と合わせる';

  @override
  String get settingsTitleHiragana => 'せってい';

  @override
  String get settingsTitleKanji => '設定';

  @override
  String get settingsSectionGeneralHiragana => 'いっぱん';

  @override
  String get settingsSectionGeneralKanji => '一般';

  @override
  String get settingsLanguageLabelHiragana => 'ことば';

  @override
  String get settingsLanguageLabelKanji => '言葉の設定';

  @override
  String get settingsLanguageDescription => '「ひらがな」か「漢字」を えらべるよ';

  @override
  String get settingsLocationLabelHiragana => 'ばしょの じょうほう';

  @override
  String get settingsLocationLabelKanji => '位置情報の利用';

  @override
  String get settingsLocationDescription =>
      'ON にすると、コンパスが もっと ただしく なるよ。OFF でも つかえるから あんしんしてね。';

  @override
  String get settingsSectionAppInfoHiragana => 'アプリの じょうほう';

  @override
  String get settingsSectionAppInfoKanji => 'アプリ情報';

  @override
  String get settingsLicensesLabelHiragana => 'つかっている ツール';

  @override
  String get settingsLicensesLabelKanji => 'OSSライセンス';

  @override
  String get settingsLicensesDescription => 'このアプリを つくるのに つかったもの';

  @override
  String headingDegrees(String degrees) {
    return '$degrees°';
  }
}
