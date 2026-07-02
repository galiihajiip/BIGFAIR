import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/landing_mock_data.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/hover_lift.dart';
import '../../../shared/widgets/responsive_container.dart';
import '../../../shared/widgets/section_header.dart';

/// Featured events grid — 3 columns desktop, 2 tablet, 1 mobile.
class FeaturedEventsSection extends StatelessWidget {
  const FeaturedEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = AppTheme.isDesktop(width)
        ? 3
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
              title: 'Pilih event yang paling cocok buat perjalananmu.',
              subtitle:
                  'Lihat rangkaian BIGFAIR, cek detail sesi, dan siapkan pengalaman belajar di luar kelas.',
              lightBackground: false,
            ),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: crossAxisCount == 1 ? 0.85 : 0.72,
              ),
              itemCount: mockEvents.length,
              itemBuilder: (context, index) =>
                  _EventCard(event: mockEvents[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event});
  final EventData event;

  @override
  Widget build(BuildContext context) {
    return HoverLift(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.outlineVariant.withValues(alpha: 0.4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster placeholder
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: event.gradientColors,
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'BIGFAIR',
                      style: GoogleFonts.sora(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.cloudWhite,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.city,
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Info area
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // City / Date chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '${event.city} · ${event.date}',
                        style: AppTextStyles.bodySm.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Venue
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 14, color: AppColors.mutedGray),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            event.venue,
                            style: AppTextStyles.bodySm.copyWith(
                              color: AppColors.mutedGray,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Benefit tags
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: event.tags
                          .map((tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceVariant,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  tag,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),

                    const Spacer(),

                    // CTA
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          'Lihat Detail',
                          style: GoogleFonts.sora(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
