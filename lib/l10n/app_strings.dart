import 'package:compass/l10n/app_localizations.dart';

/// Resolves the correct hiragana or kanji variant of each switchable string
/// based on [isHiragana]. Non-switchable strings (descriptions) are exposed
/// directly from [AppLocalizations].
final class AppStrings {
  const AppStrings._({
    required AppLocalizations localizations,
    required bool isHiragana,
  })  : _localizations = localizations,
        _isHiragana = isHiragana;

  factory AppStrings.of(AppLocalizations localizations, bool isHiragana) {
    return AppStrings._(
      localizations: localizations,
      isHiragana: isHiragana,
    );
  }

  final AppLocalizations _localizations;
  final bool _isHiragana;

  String get directionNorth => _isHiragana
      ? _localizations.directionNorthHiragana
      : _localizations.directionNorthKanji;

  String get directionEast => _isHiragana
      ? _localizations.directionEastHiragana
      : _localizations.directionEastKanji;

  String get directionSouth => _isHiragana
      ? _localizations.directionSouthHiragana
      : _localizations.directionSouthKanji;

  String get directionWest => _isHiragana
      ? _localizations.directionWestHiragana
      : _localizations.directionWestKanji;

  String get directionNorthEast => _isHiragana
      ? _localizations.directionNorthEastHiragana
      : _localizations.directionNorthEastKanji;

  String get directionNorthWest => _isHiragana
      ? _localizations.directionNorthWestHiragana
      : _localizations.directionNorthWestKanji;

  String get directionSouthEast => _isHiragana
      ? _localizations.directionSouthEastHiragana
      : _localizations.directionSouthEastKanji;

  String get directionSouthWest => _isHiragana
      ? _localizations.directionSouthWestHiragana
      : _localizations.directionSouthWestKanji;

  String get modePersonLabel => _isHiragana
      ? _localizations.modePersonLabelHiragana
      : _localizations.modePersonLabelKanji;

  String get modeMapLabel => _isHiragana
      ? _localizations.modeMapLabelHiragana
      : _localizations.modeMapLabelKanji;

  String get settingsTitle => _isHiragana
      ? _localizations.settingsTitleHiragana
      : _localizations.settingsTitleKanji;

  String get settingsSectionGeneral => _isHiragana
      ? _localizations.settingsSectionGeneralHiragana
      : _localizations.settingsSectionGeneralKanji;

  String get settingsLanguageLabel => _isHiragana
      ? _localizations.settingsLanguageLabelHiragana
      : _localizations.settingsLanguageLabelKanji;

  String get settingsLanguageDescription =>
      _localizations.settingsLanguageDescription;

  String get settingsLocationLabel => _isHiragana
      ? _localizations.settingsLocationLabelHiragana
      : _localizations.settingsLocationLabelKanji;

  String get settingsLocationDescription =>
      _localizations.settingsLocationDescription;

  String get settingsSectionAppInfo => _isHiragana
      ? _localizations.settingsSectionAppInfoHiragana
      : _localizations.settingsSectionAppInfoKanji;

  String get settingsLicensesLabel => _isHiragana
      ? _localizations.settingsLicensesLabelHiragana
      : _localizations.settingsLicensesLabelKanji;

  String get settingsLicensesDescription =>
      _localizations.settingsLicensesDescription;
}
