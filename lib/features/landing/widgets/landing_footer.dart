import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/responsive_container.dart';

/// Landing page footer with logo, columns, and copyright.
class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);

    return Container(
      color: AppColors.inkBlack,
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _LogoBlock(),
                      const SizedBox(height: 32),
                      ..._columns
                          .map((col) => Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: _FooterColumn(data: col),
                              ))
                          ,
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _LogoBlock()),
                      ..._columns
                          .map((col) => Expanded(
                                flex: 2,
                                child: _FooterColumn(data: col),
                              ))
                          ,
                    ],
                  ),
            const SizedBox(height: 40),
            Divider(
              color: AppColors.outlineVariant.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 20),
            Text(
              '© 2026 BIGFAIR. All rights reserved.',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.mutedGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'B1GFAIR',
          style: GoogleFonts.sora(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Festival edukasi nasional untuk generasi muda yang ingin belajar, '
          'bertumbuh, dan memperluas relasi.',
          style: AppTextStyles.bodyMd.copyWith(
            color: AppColors.mutedGray,
          ),
        ),
      ],
    );
  }
}

class _FooterColumnData {
  const _FooterColumnData({required this.title, required this.links});
  final String title;
  final List<String> links;
}

const _columns = [
  _FooterColumnData(
    title: 'Navigasi',
    links: ['Event', 'Benefit', 'Cara Kerja', 'Kota', 'FAQ'],
  ),
  _FooterColumnData(
    title: 'Platform',
    links: ['Aplikasi', 'Tiket', 'Sertifikat', 'Pesanan'],
  ),
  _FooterColumnData(
    title: 'Bantuan',
    links: ['Kontak', 'FAQ', 'Kebijakan Privasi'],
  ),
  _FooterColumnData(
    title: 'Sosial',
    links: ['Instagram', 'TikTok', 'Website'],
  ),
];

class _FooterColumn extends StatelessWidget {
  const _FooterColumn({required this.data});
  final _FooterColumnData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title,
          style: GoogleFonts.sora(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.onSurface,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        ...data.links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  link,
                  style: AppTextStyles.bodySm.copyWith(
                    color: AppColors.mutedGray,
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
