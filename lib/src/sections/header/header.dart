import 'package:flutter/material.dart' hide NavigationBar;
import 'package:portfolio/src/components/button.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:portfolio/src/core/text_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hi, my name is',
            style: headingIntro,
          ),
          Text(
            'Sam Smets.',
            style: heading.copyWith(color: PortfolioColors.secondary),
          ),
          const Text(
            'I build things for mobile.',
            style: heading,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: const Text(
              'I’m a software engineer specializing in building exceptional digital experiences. '
              'Currently, I’m focused on building accessible, human-centered products at Skipr.',
              style: text,
            ),
          ),
          const SizedBox(height: 40),
          Button(title: 'Send me a message!', onTap: () {})
        ],
      ),
    );
  }
}
