import 'package:flutter/material.dart';

import '../../../data/landing_mock_data.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/responsive_container.dart';
import '../../../shared/widgets/section_header.dart';

/// Benefits section — 5 cards with icons and lavender accents.
/// Desktop: 3 top + 2 bottom centered. Mobile: stacked.
class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);
    final isDesktop = AppTheme.isDesktop(width);

    return Container(
      color: AppColors.lavenderMist.withValues(alpha: 0.06),
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            const SectionHeader(
              title: 'Lebih dari sekadar datang ke seminar.',
              lightBackground: false,
            ),
            const SizedBox(height: 48),
            if (isMobile)
              Column(
                children: mockBenefits
                    .map((b) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _BenefitCard(data: b),
                        ))
                    .toList(),
              )
            else ...[
              // First row — 3 cards
              Row(
                children: mockBenefits
                    .take(3)
                    .map((b) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _BenefitCard(data: b),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              // Second row — 2 cards centered
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: mockBenefits
                    .skip(3)
                    .map((b) => SizedBox(
                          width: isDesktop ? 360 : 280,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            child: _BenefitCard(data: b),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  const _BenefitCard({required this.data});
  final BenefitData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon badge
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Icon(data.icon, size: 24, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          Text(
            data.title,
            style: AppTextStyles.headlineSm.copyWith(
              fontSize: 18,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            style: AppTextStyles.bodyMd.copyWith(
              color: AppColors.mutedGray,
            ),
          ),
        ],
      ),
    );
  }
}
