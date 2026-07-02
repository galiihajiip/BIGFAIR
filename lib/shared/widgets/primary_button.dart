import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum ButtonVariant { filled, outlined, ghost }

/// Pill-shaped CTA button with hover scale effect.
class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.filled,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final IconData? icon;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isFilled = widget.variant == ButtonVariant.filled;
    final isOutlined = widget.variant == ButtonVariant.outlined;

    Color bg;
    Color fg;
    Border? border;

    if (isFilled) {
      bg = AppColors.secondary;
      fg = AppColors.onSecondaryFixed;
      border = null;
    } else if (isOutlined) {
      bg = _hovering ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent;
      fg = AppColors.primary;
      border = Border.all(color: AppColors.primary, width: 2);
    } else {
      bg = Colors.transparent;
      fg = AppColors.primary;
      border = null;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onPressed ?? () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          // ignore: deprecated_member_use
          transform: Matrix4.identity()..scale(_hovering ? 1.03 : 1.0),
          transformAlignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(999),
            border: border,
            boxShadow: isFilled && _hovering
                ? [
                    BoxShadow(
                      color: AppColors.eventGold.withValues(alpha: 0.35),
                      blurRadius: 24,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 18, color: fg),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: AppTextStyles.labelMd.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
