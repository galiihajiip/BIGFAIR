import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/landing_mock_data.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/responsive_container.dart';
import '../../../shared/widgets/section_header.dart';

/// FAQ section with expandable accordion cards.
class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            const SectionHeader(
              title: 'Pertanyaan yang sering diajukan',
              lightBackground: false,
            ),
            const SizedBox(height: 40),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                children: mockFaqs
                    .map((faq) => _FaqTile(item: faq))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.item});
  final FaqItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.outlineVariant.withValues(alpha: 0.25),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ExpansionTile(
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            childrenPadding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            iconColor: AppColors.primary,
            collapsedIconColor: AppColors.mutedGray,
            title: Text(
              item.question,
              style: GoogleFonts.sora(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            children: [
              Text(
                item.answer,
                style: AppTextStyles.bodyMd.copyWith(
                  color: AppColors.mutedGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
