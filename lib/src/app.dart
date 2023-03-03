import 'package:flutter/material.dart';
import 'package:portfolio/src/core/colors.dart';
import 'package:portfolio/src/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: PortfolioColors.background,
        colorScheme: const ColorScheme.dark(
          background: PortfolioColors.background,
          primary: PortfolioColors.primary,
          secondary: PortfolioColors.secondary,
        ),
      ),
      home: const HomePage(),
    );
  }
}
