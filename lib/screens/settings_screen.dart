import 'package:compass/l10n/app_localizations.dart';
import 'package:compass/l10n/app_strings.dart';
import 'package:compass/providers/package_info_provider.dart';
import 'package:compass/providers/settings_provider.dart';
import 'package:compass/widgets/segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHiragana = ref.watch(
      settingsProvider.select((s) => s.isHiragana),
    );
    final strings = AppStrings.of(
      AppLocalizations.of(context)!,
      isHiragana,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(title: strings.settingsTitle),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    _SectionLabel(label: strings.settingsSectionGeneral),
                    const SizedBox(height: 16),
                    _LanguageCard(
                      isHiragana: isHiragana,
                      strings: strings,
                      onChanged: (value) => ref
                          .read(settingsProvider.notifier)
                          .setIsHiragana(value),
                    ),
                    const SizedBox(height: 16),
                    _LocationCard(
                      strings: strings,
                      onEnable: () => ref
                          .read(settingsProvider.notifier)
                          .setLocationEnabled(true),
                    ),
                    const SizedBox(height: 32),
                    _SectionLabel(label: strings.settingsSectionAppInfo),
                    const SizedBox(height: 16),
                    _LicensesCard(
                      strings: strings,
                      onTap: () => showLicensePage(context: context),
                    ),
                    const SizedBox(height: 48),
                    _AppVersionLabel(strings: strings),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        children: [
          Material(
            color: colors.surfaceContainerLowest,
            elevation: 2,
            shadowColor: colors.primary.withAlpha(20),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Icon(Icons.arrow_back, color: colors.primary, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: textTheme.headlineMedium?.copyWith(
              color: colors.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Text(
      label,
      style: textTheme.titleMedium?.copyWith(
        color: colors.onSurfaceVariant,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.isHiragana,
    required this.strings,
    required this.onChanged,
  });

  final bool isHiragana;
  final AppStrings strings;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.settingsLanguageDescription,
          style: textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
        ),
        const SizedBox(height: 12),
        AppSegmentedControl(
          segments: [
            AppSegment(
              label: strings.langOptionHiragana,
              selected: isHiragana,
              onTap: () => onChanged(true),
            ),
            AppSegment(
              label: strings.langOptionKanji,
              selected: !isHiragana,
              onTap: () => onChanged(false),
            ),
          ],
        ),
      ],
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({
    required this.strings,
    required this.onEnable,
  });

  final AppStrings strings;
  final VoidCallback onEnable;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withAlpha(20),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: colors.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.location_on, color: colors.primary, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      strings.settingsLocationLabel,
                      style: textTheme.titleMedium?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      strings.settingsLocationDescription,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final locationEnabled = ref.watch(
                settingsProvider.select((s) => s.locationEnabled),
              );
              if (!locationEnabled) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: onEnable,
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.primary,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      strings.settingsLocationLabel,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colors.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LicensesCard extends StatelessWidget {
  const _LicensesCard({
    required this.strings,
    required this.onTap,
  });

  final AppStrings strings;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: colors.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: colors.primary.withAlpha(20),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: colors.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.description_outlined,
                  color: colors.primary,
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      strings.settingsLicensesLabel,
                      style: textTheme.titleMedium?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      strings.settingsLicensesDescription,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: colors.primary),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppVersionLabel extends ConsumerWidget {
  const _AppVersionLabel({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final info = ref.watch(packageInfoProvider);
    return Center(
      child: Text(
        strings.appVersion(info.appName, info.version),
        style: textTheme.labelSmall?.copyWith(
          color: colors.onSurfaceVariant.withAlpha(100),
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
