import 'package:flutter/material.dart' hide NavigationBar;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/components/email_link.dart';
import 'package:portfolio/src/components/social_link.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:portfolio/src/sections/header/header.dart';
import 'package:portfolio/src/sections/header/navigation_bar.dart';

import 'sections/about/about_me.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        leadingWidth: 70,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/images/logo-icon.png',
            width: 50,
            color: PortfolioColors.primary,
          ),
        ),
        actions: const [
          NavigationBar(),
          SizedBox(width: 20),
        ],
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              children: const [
                Header(),
                AboutMe(),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: 100,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SocialLink(
                      iconData: FontAwesomeIcons.linkedin,
                      url: 'https://www.linkedin.com/in/sam-smets-90336471/',
                    ),
                    const SizedBox(height: 20),
                    const SocialLink(
                      iconData: FontAwesomeIcons.github,
                      url: 'https://github.com/Sadoge',
                    ),
                    const SizedBox(height: 20),
                    Container(width: 0.5, height: 80, color: Colors.white)
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                width: 100,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const EmailLink(),
                    const SizedBox(height: 20),
                    Container(
                      width: 0.5,
                      height: 80,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
