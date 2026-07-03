import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/theme/app_colors.dart';

class LandingBottomNav extends StatelessWidget {
  const LandingBottomNav({super.key, this.onNavTap});

  final void Function(String section)? onNavTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.95),
        border: const Border(
          top: BorderSide(
            color: Color(0x33E9D5FF), // borderLavender 20%
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BottomNavItem(
                icon: Icons.event_rounded,
                label: 'Event',
                onTap: () => onNavTap?.call('event'),
              ),
              _BottomNavItem(
                icon: Icons.star_rounded,
                label: 'Benefit',
                onTap: () => onNavTap?.call('benefit'),
              ),
              _BottomNavItem(
                icon: Icons.location_city_rounded,
                label: 'Kota',
                onTap: () => onNavTap?.call('kota'),
              ),
              _BottomNavItem(
                icon: Icons.help_outline_rounded,
                label: 'FAQ',
                onTap: () => onNavTap?.call('faq'),
              ),
              _BottomNavItem(
                icon: Icons.login_rounded,
                label: 'Masuk',
                isPrimary: true,
                onTap: () {
                  launchUrl(Uri.parse('http://localhost:8000/admin/login'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final color = isPrimary ? AppColors.primary : AppColors.onSurfaceVariant;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.sora(
                fontSize: 10,
                fontWeight: isPrimary ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
