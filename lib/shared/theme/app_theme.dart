import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// B1GFAIR Design System — ThemeData & responsive breakpoints.
abstract final class AppTheme {
  // ── Breakpoints ──────────────────────────────────────────────────
  static const double mobileBreak = 700;
  static const double tabletBreak = 1024;
  static const double maxContentWidth = 1240;

  /// Horizontal page padding for the current width.
  static double pagePadding(double width) {
    if (width < mobileBreak) return 20;
    if (width < tabletBreak) return 40;
    return 72;
  }

  static bool isMobile(double width) => width < mobileBreak;
  static bool isTablet(double width) =>
      width >= mobileBreak && width < tabletBreak;
  static bool isDesktop(double width) => width >= tabletBreak;

  // ── Theme ────────────────────────────────────────────────────────
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.surface,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          secondaryContainer: AppColors.secondaryContainer,
          onSecondaryContainer: AppColors.onSecondaryContainer,
          tertiary: AppColors.tertiary,
          onTertiary: AppColors.onTertiary,
          tertiaryContainer: AppColors.tertiaryContainer,
          onTertiaryContainer: AppColors.onTertiaryContainer,
          error: AppColors.error,
          onError: AppColors.onError,
          errorContainer: AppColors.errorContainer,
          onErrorContainer: AppColors.onErrorContainer,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          outline: AppColors.outline,
          outlineVariant: AppColors.outlineVariant,
          inverseSurface: AppColors.inverseSurface,
          onInverseSurface: AppColors.inverseOnSurface,
          inversePrimary: AppColors.inversePrimary,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.dark().textTheme,
        ),
      );
}
