import 'dart:ui';

/// B1GFAIR Design System — Color Tokens
///
/// All colors are sourced from the brand palette and
/// the Material 3 dark-theme surface system used in the HTML reference.
abstract final class AppColors {
  // ── Brand Primaries ──────────────────────────────────────────────
  static const primaryPurple = Color(0xFF6D28D9);
  static const deepViolet = Color(0xFF2E1065);
  static const electricPurple = Color(0xFF8B5CF6);
  static const lavenderMist = Color(0xFFF3E8FF);
  static const eventGold = Color(0xFFF6C85F);
  static const magentaGlow = Color(0xFFD946EF);

  // ── Neutrals ─────────────────────────────────────────────────────
  static const inkBlack = Color(0xFF111014);
  static const charcoal = Color(0xFF1F1B2E);
  static const cloudWhite = Color(0xFFFBFAFF);
  static const mutedGray = Color(0xFF6B6675);
  static const borderLavender = Color(0xFFE9D5FF);

  // ── M3 Surface System (dark) ─────────────────────────────────────
  static const surface = Color(0xFF141317);
  static const surfaceDim = Color(0xFF141317);
  static const surfaceContainerLowest = Color(0xFF0F0E12);
  static const surfaceContainerLow = Color(0xFF1C1B1F);
  static const surfaceContainer = Color(0xFF201F23);
  static const surfaceContainerHigh = Color(0xFF2B292E);
  static const surfaceContainerHighest = Color(0xFF363439);
  static const surfaceBright = Color(0xFF3A383D);
  static const surfaceVariant = Color(0xFF363439);

  // ── On-Surface ───────────────────────────────────────────────────
  static const onSurface = Color(0xFFE6E1E7);
  static const onSurfaceVariant = Color(0xFFCCC3D7);
  static const onBackground = Color(0xFFE6E1E7);

  // ── M3 Primary tokens ────────────────────────────────────────────
  static const primary = Color(0xFFD3BBFF);
  static const onPrimary = Color(0xFF3F008D);
  static const primaryContainer = Color(0xFF6D28D9);
  static const onPrimaryContainer = Color(0xFFDAC5FF);
  static const primaryFixed = Color(0xFFEBDDFF);
  static const primaryFixedDim = Color(0xFFD3BBFF);

  // ── M3 Secondary tokens ──────────────────────────────────────────
  static const secondary = Color(0xFFEEC058);
  static const onSecondary = Color(0xFF3F2E00);
  static const secondaryContainer = Color(0xFF916C01);
  static const onSecondaryContainer = Color(0xFFFFF7EE);
  static const secondaryFixed = Color(0xFFFFDF9D);
  static const onSecondaryFixed = Color(0xFF251A00);

  // ── M3 Tertiary tokens ───────────────────────────────────────────
  static const tertiary = Color(0xFFFBABFF);
  static const onTertiary = Color(0xFF580065);
  static const tertiaryContainer = Color(0xFF9800AE);
  static const onTertiaryContainer = Color(0xFFFDB7FF);

  // ── Outline ──────────────────────────────────────────────────────
  static const outline = Color(0xFF958DA1);
  static const outlineVariant = Color(0xFF4A4455);

  // ── Error ────────────────────────────────────────────────────────
  static const error = Color(0xFFFFB4AB);
  static const onError = Color(0xFF690005);
  static const errorContainer = Color(0xFF93000A);
  static const onErrorContainer = Color(0xFFFFDAD6);

  // ── Inverse ──────────────────────────────────────────────────────
  static const inverseSurface = Color(0xFFE6E1E7);
  static const inverseOnSurface = Color(0xFF313034);
  static const inversePrimary = Color(0xFF7331DF);
}
