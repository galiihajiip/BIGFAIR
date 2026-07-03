import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_theme.dart';

/// Sticky navbar with glass background.
/// Desktop: logo + nav links + CTA.
/// Mobile: logo + hamburger → dropdown.
class LandingNavbar extends StatefulWidget {
  const LandingNavbar({super.key, this.onNavTap});

  final void Function(String section)? onNavTap;

  @override
  State<LandingNavbar> createState() => _LandingNavbarState();
}

class _LandingNavbarState extends State<LandingNavbar> {
  bool _menuOpen = false;

  static const _links = ['Event', 'Benefit', 'Cara Kerja', 'Kota', 'FAQ'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);
    final topPadding = MediaQuery.paddingOf(context).top;
    final height = 80.0 + (isMobile ? topPadding : 0.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height,
          padding: EdgeInsets.only(top: isMobile ? topPadding : 0.0),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.82),
            border: const Border(
              bottom: BorderSide(
                color: Color(0x33E9D5FF), // borderLavender 20%
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.electricPurple.withValues(alpha: 0.12),
                blurRadius: 32,
              ),
            ],
          ),
          child: ClipRect(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.pagePadding(width),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
                  child: Row(
                    children: [
                      // ── Logo ──
                      Image.asset(
                        'assets/images/logo-dark.png',
                        height: 56,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),

                      // ── Desktop nav links ──
                      if (!isMobile) ...[
                        ..._links.map((label) => _NavLink(
                              label: label,
                              onTap: () =>
                                  widget.onNavTap?.call(label.toLowerCase()),
                            )),
                        const SizedBox(width: 16),
                        _GhostButton(
                          label: 'Masuk',
                          onTap: () {
                            launchUrl(Uri.parse('http://localhost:8000/admin/login'));
                          },
                        ),
                        const SizedBox(width: 8),
                        _FilledNavButton(
                          label: 'Lihat Event',
                          onTap: () =>
                              widget.onNavTap?.call('event'),
                        ),
                      ],

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Private helper widgets ──────────────────────────────────────────

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            widget.label,
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: _hovered ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      child: Text(label),
    );
  }
}

class _FilledNavButton extends StatelessWidget {
  const _FilledNavButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryContainer,
        foregroundColor: AppColors.onPrimaryContainer,
        textStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        elevation: 0,
      ),
      child: Text(label),
    );
  }
}
