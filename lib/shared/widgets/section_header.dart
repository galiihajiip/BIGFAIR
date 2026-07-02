import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';

/// Reusable section header with optional subtitle.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.lightBackground = true,
  });

  final String title;
  final String? subtitle;
  final bool lightBackground;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);

    return Column(
      children: [
        Text(
          title,
          style: (isMobile
                  ? AppTextStyles.headlineLgMobile
                  : AppTextStyles.headlineLg)
              .copyWith(
            color:
                lightBackground ? AppColors.inkBlack : AppColors.cloudWhite,
          ),
          textAlign: TextAlign.center,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: AppTextStyles.bodyLg.copyWith(
              color: lightBackground
                  ? AppColors.mutedGray
                  : AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
