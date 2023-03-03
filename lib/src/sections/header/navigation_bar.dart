import 'package:flutter/material.dart';
import 'package:portfolio/src/components/button.dart';
import 'package:portfolio/src/components/navigation_item.dart';

final navigationItems = ['About', 'Experience', 'Work', 'Contact'];

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(children: _buildNavigationItems()),
        Button(title: 'Resume', type: ButtonType.small, onTap: () {})
      ],
    );
  }
}

List<Widget> _buildNavigationItems() {
  final items = <Widget>[];

  for (var i = 0; i < navigationItems.length; i++) {
    items.add(
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: NavigationItem(
          title: navigationItems.elementAt(i),
          index: i + 1,
          onTap: () {},
        ),
      ),
    );
  }

  return items;
}
