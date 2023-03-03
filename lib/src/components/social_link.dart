import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLink extends StatefulWidget {
  final IconData iconData;
  final String url;

  const SocialLink({
    required this.iconData,
    required this.url,
    super.key,
  });

  @override
  State<SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<SocialLink> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(
        Uri.parse(widget.url),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovering ? -5 : 0, 0),
          child: FaIcon(
            widget.iconData,
            color: _isHovering
                ? PortfolioColors.primary
                : PortfolioColors.secondary,
          ),
        ),
      ),
    );
  }
}
