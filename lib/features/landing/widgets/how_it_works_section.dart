import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/landing_mock_data.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/responsive_container.dart';
import '../../../shared/widgets/section_header.dart';

/// How-it-works timeline.
/// Desktop: horizontal with connector lines.
/// Mobile: vertical timeline.
class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);

    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            const SectionHeader(
              title:
                  'Dari cari event sampai check-in, semua lebih sat-set.',
              lightBackground: false,
            ),
            const SizedBox(height: 56),
            isMobile ? _VerticalTimeline() : _HorizontalTimeline(),
          ],
        ),
      ),
    );
  }
}

// ── Horizontal (Desktop) ────────────────────────────────────────────

class _HorizontalTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(mockSteps.length * 2 - 1, (index) {
            if (index.isOdd) {
              // Connector line
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.5),
                          AppColors.primary.withValues(alpha: 0.2),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            final step = mockSteps[index ~/ 2];
            return Expanded(
              flex: 2,
              child: _StepItem(step: step),
            );
          }),
        );
      },
    );
  }
}

class _StepItem extends StatelessWidget {
  const _StepItem({required this.step});
  final HowItWorksStep step;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Number badge
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryContainer.withValues(alpha: 0.4),
                blurRadius: 16,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            '${step.number}',
            style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.cloudWhite,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          step.title,
          style: AppTextStyles.headlineSm.copyWith(
            fontSize: 16,
            color: AppColors.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          step.description,
          style: AppTextStyles.bodySm.copyWith(color: AppColors.mutedGray),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// ── Vertical (Mobile) ───────────────────────────────────────────────

class _VerticalTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: mockSteps.map((step) {
        final isLast = step.number == mockSteps.length;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline rail
              SizedBox(
                width: 48,
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryContainer
                                .withValues(alpha: 0.35),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${step.number}',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.cloudWhite,
                        ),
                      ),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: AppColors.primary.withValues(alpha: 0.25),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step.title,
                        style: AppTextStyles.headlineSm.copyWith(
                          fontSize: 16,
                          color: AppColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        step.description,
                        style: AppTextStyles.bodySm
                            .copyWith(color: AppColors.mutedGray),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
