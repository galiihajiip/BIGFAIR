import 'package:flutter/material.dart';

/// Wraps a child widget and applies a subtle lift (translate + shadow)
/// when the mouse hovers over it. Web-friendly hover effect.
class HoverLift extends StatefulWidget {
  const HoverLift({
    super.key,
    required this.child,
    this.liftAmount = 6,
  });

  final Widget child;
  final double liftAmount;

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: _hovering
            // ignore: deprecated_member_use
            ? (Matrix4.identity()..translate(0.0, -widget.liftAmount))
            : Matrix4.identity(),
        child: widget.child,
      ),
    );
  }
}
