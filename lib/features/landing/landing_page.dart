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
import 'widgets/landing_bottom_nav.dart';
import 'widgets/trust_strip.dart';
import '../../shared/theme/app_theme.dart';
/// Assembles all landing page sections in a single scrollable view
/// with the sticky navbar layered on top.
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  
  final _eventKey = GlobalKey();
  final _benefitKey = GlobalKey();
  final _kotaKey = GlobalKey();
  final _faqKey = GlobalKey();

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section.toLowerCase()) {
      case 'event':
        targetKey = _eventKey;
        break;
      case 'benefit':
        targetKey = _benefitKey;
        break;
      case 'kota':
        targetKey = _kotaKey;
        break;
      case 'faq':
        targetKey = _faqKey;
        break;
    }
    
    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = AppTheme.isMobile(width);

    return Scaffold(
      body: Stack(
        children: [
          // ── Scrollable content ──
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const HeroSection(),
                const TrustStrip(),
                FeaturedEventsSection(key: _eventKey),
                BenefitsSection(key: _benefitKey),
                const HowItWorksSection(),
                CitiesSection(key: _kotaKey),
                const AppPreviewSection(),
                FaqSection(key: _faqKey),
                const FinalCtaSection(),
                LandingFooter(onNavTap: _scrollToSection),
              ],
            ),
          ),

          // ── Fixed navbar (Desktop only) ──
          if (!isMobile)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LandingNavbar(onNavTap: _scrollToSection),
            ),
        ],
      ),
      bottomNavigationBar: isMobile ? LandingBottomNav(onNavTap: _scrollToSection) : null,
    );
  }
}
