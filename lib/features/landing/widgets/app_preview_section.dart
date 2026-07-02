import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/responsive_container.dart';
import '../../../shared/widgets/section_header.dart';

/// App preview section with 4 mini-screen cards.
class AppPreviewSection extends StatelessWidget {
  const AppPreviewSection({super.key});

  static const _screens = [
    _ScreenData(
      title: 'Katalog Event',
      icon: Icons.explore_outlined,
      lines: ['BIGFAIR Surabaya', 'BIGFAIR Bandung', 'BIGFAIR Yogyakarta'],
    ),
    _ScreenData(
      title: 'Detail Event',
      icon: Icons.event_note_outlined,
      lines: ['Venue · Jadwal', 'Speaker · Rundown', 'Benefit · Kapasitas'],
    ),
    _ScreenData(
      title: 'Pesanan',
      icon: Icons.receipt_long_outlined,
      lines: ['Tiket aktif', 'Riwayat pesanan', 'Status pembayaran'],
    ),
    _ScreenData(
      title: 'Profil Peserta',
      icon: Icons.person_outline_rounded,
      lines: ['Data diri', 'E-Certificate', 'Riwayat event'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = AppTheme.isDesktop(width)
        ? 4
        : AppTheme.isTablet(width)
            ? 2
            : 1;

    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            const SectionHeader(
              title:
                  'Satu aplikasi untuk pengalaman event yang lebih rapi.',
              subtitle:
                  'Dari katalog event sampai pesanan, semua dibuat agar peserta bisa fokus menikmati acaranya.',
              lightBackground: false,
            ),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: crossAxisCount == 1 ? 1.6 : 0.75,
              ),
              itemCount: _screens.length,
              itemBuilder: (context, index) =>
                  _ScreenCard(data: _screens[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreenData {
  const _ScreenData({
    required this.title,
    required this.icon,
    required this.lines,
  });
  final String title;
  final IconData icon;
  final List<String> lines;
}

class _ScreenCard extends StatelessWidget {
  const _ScreenCard({required this.data});
  final _ScreenData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          // Mini phone top bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.15),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              children: [
                Icon(data.icon, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  data.title,
                  style: GoogleFonts.sora(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          // Mockup content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data.lines
                    .map((line) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              line,
                              style: AppTextStyles.bodySm.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
