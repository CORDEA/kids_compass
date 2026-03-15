import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static const Color _primary = Color(0xFF006591);
  static const Color _tertiary = Color(0xFFb91a24);
  static const Color _surface = Color(0xFFf6fafe);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primary,
      surface: _surface,
    ).copyWith(tertiary: _tertiary, tertiaryContainer: const Color(0xFFFFDAD6));

    final textTheme = GoogleFonts.zenMaruGothicTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }
}
