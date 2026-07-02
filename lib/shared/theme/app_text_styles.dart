import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// B1GFAIR Design System — Typography
///
/// Two font families only:
///   • **Sora** — display / headline / label
///   • **Plus Jakarta Sans** — body
abstract final class AppTextStyles {
  // ── Display ──────────────────────────────────────────────────────
  static TextStyle displayXl = GoogleFonts.sora(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    height: 1.1,
    letterSpacing: -0.02 * 72,
    color: AppColors.cloudWhite,
  );

  static TextStyle displayLg = GoogleFonts.sora(
    fontSize: 56,
    fontWeight: FontWeight.w800,
    height: 1.1,
    letterSpacing: -0.02 * 56,
    color: AppColors.cloudWhite,
  );

  static TextStyle displayLgMobile = GoogleFonts.sora(
    fontSize: 42,
    fontWeight: FontWeight.w800,
    height: 1.1,
    color: AppColors.cloudWhite,
  );

  // ── Headline ─────────────────────────────────────────────────────
  static TextStyle headlineLg = GoogleFonts.sora(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.01 * 40,
    color: AppColors.onSurface,
  );

  static TextStyle headlineLgMobile = GoogleFonts.sora(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.onSurface,
  );

  static TextStyle headlineMd = GoogleFonts.sora(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.onSurface,
  );

  static TextStyle headlineSm = GoogleFonts.sora(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.onSurface,
  );

  // ── Label ────────────────────────────────────────────────────────
  static TextStyle labelMd = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.05 * 14,
    color: AppColors.onSurface,
  );

  // ── Body ─────────────────────────────────────────────────────────
  static TextStyle bodyLg = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle bodyMd = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle bodySm = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.onSurfaceVariant,
  );
}
