import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ja')];

  /// No description provided for @appTitle.
  ///
  /// In ja, this message translates to:
  /// **'コンパス'**
  String get appTitle;

  /// No description provided for @directionNorthHiragana.
  ///
  /// In ja, this message translates to:
  /// **'きた'**
  String get directionNorthHiragana;

  /// No description provided for @directionNorthKanji.
  ///
  /// In ja, this message translates to:
  /// **'北'**
  String get directionNorthKanji;

  /// No description provided for @directionEastHiragana.
  ///
  /// In ja, this message translates to:
  /// **'ひがし'**
  String get directionEastHiragana;

  /// No description provided for @directionEastKanji.
  ///
  /// In ja, this message translates to:
  /// **'東'**
  String get directionEastKanji;

  /// No description provided for @directionSouthHiragana.
  ///
  /// In ja, this message translates to:
  /// **'みなみ'**
  String get directionSouthHiragana;

  /// No description provided for @directionSouthKanji.
  ///
  /// In ja, this message translates to:
  /// **'南'**
  String get directionSouthKanji;

  /// No description provided for @directionWestHiragana.
  ///
  /// In ja, this message translates to:
  /// **'にし'**
  String get directionWestHiragana;

  /// No description provided for @directionWestKanji.
  ///
  /// In ja, this message translates to:
  /// **'西'**
  String get directionWestKanji;

  /// No description provided for @directionNorthEastHiragana.
  ///
  /// In ja, this message translates to:
  /// **'ほくとう'**
  String get directionNorthEastHiragana;

  /// No description provided for @directionNorthEastKanji.
  ///
  /// In ja, this message translates to:
  /// **'北東'**
  String get directionNorthEastKanji;

  /// No description provided for @directionNorthWestHiragana.
  ///
  /// In ja, this message translates to:
  /// **'ほくせい'**
  String get directionNorthWestHiragana;

  /// No description provided for @directionNorthWestKanji.
  ///
  /// In ja, this message translates to:
  /// **'北西'**
  String get directionNorthWestKanji;

  /// No description provided for @directionSouthEastHiragana.
  ///
  /// In ja, this message translates to:
  /// **'なんとう'**
  String get directionSouthEastHiragana;

  /// No description provided for @directionSouthEastKanji.
  ///
  /// In ja, this message translates to:
  /// **'南東'**
  String get directionSouthEastKanji;

  /// No description provided for @directionSouthWestHiragana.
  ///
  /// In ja, this message translates to:
  /// **'なんせい'**
  String get directionSouthWestHiragana;

  /// No description provided for @directionSouthWestKanji.
  ///
  /// In ja, this message translates to:
  /// **'南西'**
  String get directionSouthWestKanji;

  /// No description provided for @modePersonLabelHiragana.
  ///
  /// In ja, this message translates to:
  /// **'じぶんの むき'**
  String get modePersonLabelHiragana;

  /// No description provided for @modePersonLabelKanji.
  ///
  /// In ja, this message translates to:
  /// **'自分の向き'**
  String get modePersonLabelKanji;

  /// No description provided for @modeMapLabelHiragana.
  ///
  /// In ja, this message translates to:
  /// **'ちずと あわせる'**
  String get modeMapLabelHiragana;

  /// No description provided for @modeMapLabelKanji.
  ///
  /// In ja, this message translates to:
  /// **'地図と合わせる'**
  String get modeMapLabelKanji;

  /// No description provided for @settingsTitleHiragana.
  ///
  /// In ja, this message translates to:
  /// **'せってい'**
  String get settingsTitleHiragana;

  /// No description provided for @settingsTitleKanji.
  ///
  /// In ja, this message translates to:
  /// **'設定'**
  String get settingsTitleKanji;

  /// No description provided for @settingsSectionGeneralHiragana.
  ///
  /// In ja, this message translates to:
  /// **'いっぱん'**
  String get settingsSectionGeneralHiragana;

  /// No description provided for @settingsSectionGeneralKanji.
  ///
  /// In ja, this message translates to:
  /// **'一般'**
  String get settingsSectionGeneralKanji;

  /// No description provided for @settingsLanguageLabelHiragana.
  ///
  /// In ja, this message translates to:
  /// **'ことば'**
  String get settingsLanguageLabelHiragana;

  /// No description provided for @settingsLanguageLabelKanji.
  ///
  /// In ja, this message translates to:
  /// **'言葉の設定'**
  String get settingsLanguageLabelKanji;

  /// No description provided for @settingsLanguageDescription.
  ///
  /// In ja, this message translates to:
  /// **'「ひらがな」か「漢字」を えらべるよ'**
  String get settingsLanguageDescription;

  /// No description provided for @settingsLocationLabelHiragana.
  ///
  /// In ja, this message translates to:
  /// **'ばしょの じょうほう'**
  String get settingsLocationLabelHiragana;

  /// No description provided for @settingsLocationLabelKanji.
  ///
  /// In ja, this message translates to:
  /// **'位置情報の利用'**
  String get settingsLocationLabelKanji;

  /// No description provided for @settingsLocationDescription.
  ///
  /// In ja, this message translates to:
  /// **'ON にすると、コンパスが もっと ただしく なるよ。OFF でも つかえるから あんしんしてね。'**
  String get settingsLocationDescription;

  /// No description provided for @settingsSectionAppInfoHiragana.
  ///
  /// In ja, this message translates to:
  /// **'アプリの じょうほう'**
  String get settingsSectionAppInfoHiragana;

  /// No description provided for @settingsSectionAppInfoKanji.
  ///
  /// In ja, this message translates to:
  /// **'アプリ情報'**
  String get settingsSectionAppInfoKanji;

  /// No description provided for @settingsLicensesLabelHiragana.
  ///
  /// In ja, this message translates to:
  /// **'つかっている ツール'**
  String get settingsLicensesLabelHiragana;

  /// No description provided for @settingsLicensesLabelKanji.
  ///
  /// In ja, this message translates to:
  /// **'OSSライセンス'**
  String get settingsLicensesLabelKanji;

  /// No description provided for @settingsLicensesDescription.
  ///
  /// In ja, this message translates to:
  /// **'このアプリを つくるのに つかったもの'**
  String get settingsLicensesDescription;

  /// Heading value with degree symbol
  ///
  /// In ja, this message translates to:
  /// **'{degrees}°'**
  String headingDegrees(String degrees);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
