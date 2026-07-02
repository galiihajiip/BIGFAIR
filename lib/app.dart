import 'package:flutter/material.dart';

import 'features/landing/landing_page.dart';
import 'shared/theme/app_theme.dart';

/// Root application widget.
class BigfairApp extends StatelessWidget {
  const BigfairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B1GFAIR | Festival Edukasi Nasional',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LandingPage(),
    );
  }
}
