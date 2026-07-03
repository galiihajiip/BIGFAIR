import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/responsive_container.dart';

/// Hero section with deep-violet gradient, radial glow, content + phone mockup.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.deepViolet, AppColors.charcoal],
        ),
      ),
      child: Stack(
        children: [
          // ── Radial glows ──
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.electricPurple.withValues(alpha: 0.35),
                    AppColors.eventGold.withValues(alpha: 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.electricPurple.withValues(alpha: 0.25),
                    AppColors.magentaGlow.withValues(alpha: 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Subtle center glow
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, -0.2),
                  radius: 1.2,
                  colors: [
                    AppColors.electricPurple.withValues(alpha: 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Content ──
          Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 100 : 120,
              bottom: isMobile ? 60 : 80,
            ),
            child: ResponsiveContainer(
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _HeroContent(isMobile: true),
                        const SizedBox(height: 48),
                        Center(child: _PhoneMockup(isMobile: true)),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 7, child: _HeroContent(isMobile: false)),
                        const SizedBox(width: 48),
                        Expanded(flex: 5, child: _PhoneMockup(isMobile: false)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Hero Text Content ───────────────────────────────────────────────

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Eyebrow
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer.withValues(alpha: 0.2),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.verified_rounded,
                size: 18,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'EVENT FESTIVAL EDUKASI NASIONAL',
                style: AppTextStyles.labelMd.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Headline
        RichText(
          text: TextSpan(
            style: isMobile
                ? AppTextStyles.displayLgMobile
                : AppTextStyles.displayLg,
            children: [
              const TextSpan(
                text: 'Upgrade diri, perluas relasi, dan temukan event ',
              ),
              TextSpan(
                text: 'BIGFAIR',
                style: TextStyle(color: AppColors.secondary),
              ),
              const TextSpan(text: ' di kotamu.'),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Subheadline
        Text(
          'Jelajahi seminar, talkshow, kompetisi, bazar, dan sesi inspiratif '
          'dari pembicara pilihan dalam satu platform yang rapi dan mudah diakses.',
          style: AppTextStyles.bodyLg.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 32),

        // CTA buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            PrimaryButton(
              label: 'Lihat Event Terdekat',
              variant: ButtonVariant.filled,
              onPressed: () {},
            ),
            PrimaryButton(
              label: 'Download Aplikasi',
              variant: ButtonVariant.outlined,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Micro trust
        Text(
          'Katalog event, tiket, pesanan, dan profil peserta dalam satu tempat.',
          style: AppTextStyles.bodySm.copyWith(
            color: AppColors.onSurfaceVariant.withValues(alpha: 0.65),
          ),
        ),
      ],
    );
  }
}

// ── Phone Mockup ────────────────────────────────────────────────────

class _PhoneMockup extends StatelessWidget {
  const _PhoneMockup({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = isMobile ? 240.0 : 280.0;
    final phoneHeight = phoneWidth * 2.05;

    return SizedBox(
      width: phoneWidth + 80, // extra space for floating chips
      height: phoneHeight + 40,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Spotlight behind phone
          Positioned.fill(
            child: Center(
              child: Container(
                width: phoneWidth * 1.3,
                height: phoneWidth * 1.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.electricPurple.withValues(alpha: 0.3),
                      AppColors.eventGold.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Phone frame
          _AnimatedFloat(
            child: Container(
              width: phoneWidth,
              height: phoneHeight,
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                borderRadius: BorderRadius.circular(36),
                border: Border.all(
                  color: AppColors.surfaceContainerHighest,
                  width: 8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Column(
                  children: [
                    // Notch
                    Container(
                      height: 28,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Container(
                        width: 60,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    // App header
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      color: AppColors.surfaceContainerLow,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/logo-dark.png',
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.search_rounded,
                            size: 18,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                    // Event card inside phone
                    Expanded(
                      child: Container(
                        color: AppColors.surfaceContainerLow,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            // Mini event poster
                            Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.primaryContainer,
                                    AppColors.electricPurple,
                                  ],
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'BIGFAIR',
                                    style: GoogleFonts.sora(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.cloudWhite,
                                    ),
                                  ),
                                  Text(
                                    'Surabaya 2026',
                                    style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Info rows
                            _PhoneInfoRow(
                              icon: Icons.location_on_outlined,
                              text: 'Airlangga Convention Center',
                            ),
                            const SizedBox(height: 6),
                            _PhoneInfoRow(
                              icon: Icons.calendar_today_outlined,
                              text: 'Minggu, 04 Januari',
                            ),
                            const SizedBox(height: 12),
                            // Chips
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                _PhoneChip('E-Ticket'),
                                _PhoneChip('E-Certificate'),
                                _PhoneChip('Fast Check-In'),
                                _PhoneChip('Speaker Session'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Floating Chips ──
          Positioned(
            top: 0,
            right: 0,
            child: _AnimatedFloat(
              offset: 1.2,
              child: _FloatingChip(
                label: 'E-Ticket',
                icon: Icons.confirmation_number_outlined,
                color: AppColors.electricPurple,
              ),
            ),
          ),
          Positioned(
            top: phoneHeight * 0.45,
            left: -20,
            child: _AnimatedFloat(
              offset: 2.0,
              child: _FloatingChip(
                label: 'E-Certificate',
                icon: Icons.workspace_premium_outlined,
                color: AppColors.secondary,
                textColor: AppColors.onSecondary,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: _AnimatedFloat(
              offset: 0.8,
              child: _FloatingChip(
                label: '8 Kota',
                icon: Icons.location_on_outlined,
                color: AppColors.surfaceVariant,
                textColor: AppColors.primaryFixedDim,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Phone mini-widgets ──────────────────────────────────────────────

class _PhoneInfoRow extends StatelessWidget {
  const _PhoneInfoRow({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.onSurfaceVariant),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              color: AppColors.onSurfaceVariant,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _PhoneChip extends StatelessWidget {
  const _PhoneChip(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryFixedDim,
        ),
      ),
    );
  }
}

class _FloatingChip extends StatelessWidget {
  const _FloatingChip({
    required this.label,
    required this.icon,
    required this.color,
    this.textColor,
  });

  final String label;
  final IconData icon;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final fg = textColor ?? AppColors.cloudWhite;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: fg),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Floating animation ──────────────────────────────────────────────

class _AnimatedFloat extends StatefulWidget {
  const _AnimatedFloat({required this.child, this.offset = 0.0});
  final Widget child;
  final double offset;

  @override
  State<_AnimatedFloat> createState() => _AnimatedFloatState();
}

class _AnimatedFloatState extends State<_AnimatedFloat>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, child) {
        final value = math.sin((_ctrl.value + widget.offset) * math.pi);
        return Transform.translate(offset: Offset(0, value * 10), child: child);
      },
      child: widget.child,
    );
  }
}
