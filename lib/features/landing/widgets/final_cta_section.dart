import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/primary_button.dart';

/// Final CTA section — deep violet gradient panel with floating ticket shapes.
class FinalCtaSection extends StatelessWidget {
  const FinalCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 64,
              vertical: isMobile ? 48 : 72,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.deepViolet, AppColors.charcoal],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryContainer.withValues(alpha: 0.2),
                  blurRadius: 48,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Floating ticket shapes
                Positioned(
                  top: -20,
                  right: -10,
                  child: Transform.rotate(
                    angle: math.pi / 12,
                    child: _TicketShape(
                      width: 80,
                      height: 50,
                      color: AppColors.primary.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: -5,
                  child: Transform.rotate(
                    angle: -math.pi / 8,
                    child: _TicketShape(
                      width: 100,
                      height: 60,
                      color: AppColors.secondary.withValues(alpha: 0.06),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: isMobile ? 20 : 80,
                  child: Transform.rotate(
                    angle: math.pi / 6,
                    child: _TicketShape(
                      width: 60,
                      height: 36,
                      color: AppColors.magentaGlow.withValues(alpha: 0.06),
                    ),
                  ),
                ),

                // Content
                Column(
                  children: [
                    Text(
                      'Siap jadi bagian dari BIGFAIR berikutnya?',
                      style: (isMobile
                              ? AppTextStyles.headlineLgMobile
                              : AppTextStyles.headlineLg)
                          .copyWith(color: AppColors.cloudWhite),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Temukan sesi inspiratif, relasi baru, dan pengalaman belajar di luar kelas.',
                      style: AppTextStyles.bodyLg.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        PrimaryButton(
                          label: 'Lihat Event',
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Simple ticket-shaped decoration.
class _TicketShape extends StatelessWidget {
  const _TicketShape({
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.1),
        ),
      ),
    );
  }
}
