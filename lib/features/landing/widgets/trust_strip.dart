import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/responsive_container.dart';

/// Compact trust statistics strip below the hero.
class TrustStrip extends StatelessWidget {
  const TrustStrip({super.key});

  static const _items = [
    _TrustItem(icon: Icons.map_outlined, label: 'Multi-kota',
        detail: 'Rangkaian event di berbagai kota Indonesia'),
    _TrustItem(icon: Icons.download_rounded, label: '10K+',
        detail: 'App downloads'),
    _TrustItem(icon: Icons.confirmation_number_outlined, label: 'E-Ticket',
        detail: 'Tiket tersimpan rapi'),
    _TrustItem(icon: Icons.workspace_premium_outlined, label: 'E-Certificate',
        detail: 'Sertifikat digital setelah event'),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);

    return Container(
      color: AppColors.surfaceContainerLowest,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: ResponsiveContainer(
        child: isMobile
            ? Column(
                children: _items
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: _TrustCard(item: item),
                        ))
                    .toList(),
              )
            : Row(
                children: _items
                    .map((item) => Expanded(child: _TrustCard(item: item)))
                    .toList(),
              ),
      ),
    );
  }
}

class _TrustItem {
  const _TrustItem({
    required this.icon,
    required this.label,
    required this.detail,
  });
  final IconData icon;
  final String label;
  final String detail;
}

class _TrustCard extends StatelessWidget {
  const _TrustCard({required this.item});
  final _TrustItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(item.icon, size: 24, color: AppColors.primary),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.label,
                style: AppTextStyles.labelMd.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.detail,
                style: AppTextStyles.bodySm.copyWith(
                  color: AppColors.mutedGray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
