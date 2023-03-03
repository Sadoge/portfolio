import 'package:flutter/material.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:portfolio/src/core/text_styles.dart';

enum ButtonType { small, large }

class Button extends StatefulWidget {
  final String title;
  final ButtonType type;
  final VoidCallback onTap;

  const Button({
    required this.title,
    required this.onTap,
    this.type = ButtonType.large,
    super.key,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.type == ButtonType.large
              ? const EdgeInsets.symmetric(vertical: 20, horizontal: 30)
              : const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: widget.type == ButtonType.large ? 60 : 40,
          decoration: BoxDecoration(
              border: Border.all(color: PortfolioColors.primary),
              borderRadius: BorderRadius.circular(4),
              color: _isHovering
                  ? PortfolioColors.primary.withOpacity(0.2)
                  : Colors.transparent),
          child: Text(widget.title, style: button),
        ),
      ),
    );
  }
}
