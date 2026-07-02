import 'package:flutter/material.dart';

import 'widgets/app_preview_section.dart';
import 'widgets/benefits_section.dart';
import 'widgets/cities_section.dart';
import 'widgets/faq_section.dart';
import 'widgets/featured_events_section.dart';
import 'widgets/final_cta_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/how_it_works_section.dart';
import 'widgets/landing_footer.dart';
import 'widgets/landing_navbar.dart';
import 'widgets/trust_strip.dart';

/// Assembles all landing page sections in a single scrollable view
/// with the sticky navbar layered on top.
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ── Scrollable content ──
          const SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(),
                TrustStrip(),
                FeaturedEventsSection(),
                BenefitsSection(),
                HowItWorksSection(),
                CitiesSection(),
                AppPreviewSection(),
                FaqSection(),
                FinalCtaSection(),
                LandingFooter(),
              ],
            ),
          ),

          // ── Fixed navbar ──
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LandingNavbar(),
          ),
        ],
      ),
    );
  }
}
