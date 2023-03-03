import 'package:flutter/material.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:portfolio/src/core/text_styles.dart';

class NavigationItem extends StatefulWidget {
  final int index;
  final String title;
  final VoidCallback onTap;

  const NavigationItem({
    required this.title,
    required this.index,
    required this.onTap,
    super.key,
  });

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '0${widget.index}. ',
                style: navigation.copyWith(color: PortfolioColors.primary),
              ),
              TextSpan(
                text: widget.title,
                style: _isHovering
                    ? navigation.copyWith(color: PortfolioColors.primary)
                    : null,
              ),
            ],
            style: navigation,
          ),
        ),
      ),
    );
  }
}
