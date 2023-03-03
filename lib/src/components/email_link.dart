import 'package:flutter/material.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:portfolio/src/core/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailLink extends StatefulWidget {
  const EmailLink({super.key});

  @override
  State<EmailLink> createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(
        Uri.parse('mailto:sammsmets@gmail.com'),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        child: RotatedBox(
          quarterTurns: 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, _isHovering ? -3 : 0, 0),
            child: Text(
              'sammsmets@gmail.com',
              style: navigation.copyWith(
                color: _isHovering
                    ? PortfolioColors.primary
                    : PortfolioColors.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
