import 'package:flutter/material.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:portfolio/src/core/text_styles.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text('01. ', style: titleMono),
              const Text('About me', style: title),
              const SizedBox(width: 20),
              Container(
                height: 0.5,
                width: 300,
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.2),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  'Hello! My name is Sam and I enjoy creating things that live on the internet. My interest in web development started back in 2012 when I decided to try editing custom Tumblr themes — turns out hacking together a custom reblog button taught me a lot about HTML & CSS!\n\n'
                  'Fast-forward to today, and I’ve had the privilege of working at an advertising agency, a start-up, a huge corporation, and a student-led design studio. My main focus these days is building accessible, inclusive products and digital experiences at Skipr for a variety of clients.\n\n'
                  'I also recently launched a course that covers everything you need to build a web app with the Spotify API using Node & React. \n'
                  'Here are a few technologies I’ve been working with recently: \n',
                  style: text,
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      transform: _isHovering
                          ? Matrix4.translationValues(20, 20, 0)
                          : Matrix4.translationValues(30, 30, 0),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PortfolioColors.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/photo_me.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: MouseRegion(
                        onEnter: (event) => setState(() => _isHovering = true),
                        onExit: (event) => setState(() => _isHovering = false),
                        child: AnimatedOpacity(
                          opacity: _isHovering ? 0 : 1,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              color: PortfolioColors.primary.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
