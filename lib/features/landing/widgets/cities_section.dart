import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/landing_mock_data.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/responsive_container.dart';
import '../../../shared/widgets/section_header.dart';

/// City discovery section with chip cards and availability status.
class CitiesSection extends StatelessWidget {
  const CitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border(
          top: BorderSide(
            color: AppColors.outlineVariant.withValues(alpha: 0.2),
          ),
          bottom: BorderSide(
            color: AppColors.outlineVariant.withValues(alpha: 0.2),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            const SectionHeader(
              title: 'BIGFAIR in your area.',
              subtitle:
                  'Rangkaian event BIGFAIR hadir di berbagai kota agar pengalaman belajar lebih dekat denganmu.',
              lightBackground: false,
            ),
            const SizedBox(height: 48),
            _CityGrid(),
          ],
        ),
      ),
    );
  }
}

class _CityGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = AppTheme.isDesktop(width)
        ? 4
        : AppTheme.isTablet(width)
            ? 3
            : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2.2,
      ),
      itemCount: mockCities.length,
      itemBuilder: (context, index) => _CityCard(city: mockCities[index]),
    );
  }
}

class _CityCard extends StatefulWidget {
  const _CityCard({required this.city});
  final CityData city;

  @override
  State<_CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<_CityCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isAvailable = widget.city.status == 'Tersedia';

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovered
            // ignore: deprecated_member_use
            ? (Matrix4.identity()..translate(0.0, -4.0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.surfaceContainerHigh
              : AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isAvailable
                ? AppColors.primary.withValues(alpha: _hovered ? 0.6 : 0.3)
                : AppColors.outlineVariant.withValues(alpha: 0.3),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.primaryContainer.withValues(alpha: 0.15),
                    blurRadius: 16,
                  ),
                ]
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_city_rounded,
                  size: 18,
                  color: isAvailable
                      ? AppColors.primary
                      : AppColors.mutedGray,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    widget.city.name,
                    style: GoogleFonts.sora(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: isAvailable
                    ? AppColors.primaryContainer.withValues(alpha: 0.2)
                    : AppColors.surfaceVariant.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                widget.city.status,
                style: AppTextStyles.bodySm.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isAvailable
                      ? AppColors.primary
                      : AppColors.mutedGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
