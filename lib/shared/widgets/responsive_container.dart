import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Constrains content to [AppTheme.maxContentWidth] and applies
/// responsive horizontal padding based on current viewport width.
class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = AppTheme.pagePadding(constraints.maxWidth);
        return Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
