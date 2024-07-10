import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habbito/core/common/constants/routes.dart';
import 'package:habbito/themes/theme.dart';

import '../../constants/app_strings.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is home Navigator.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kLightColor,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        // selectedLabelStyle:
        //     const TextStyle(letterSpacing: 0, height: 0, fontSize: 0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.home),
            icon: Icon(CupertinoIcons.home),
            label: home_label,
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.library_add_check),
            icon: Icon(Icons.library_add_check),
            label: 'Topics',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.chat_bubble_2),
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person_2_outlined),
            icon: Icon(Icons.person_2_outlined),
            label: 'Personal',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.info_outline),
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(home_page_route)) {
      return 0;
    }
    if (location.startsWith(topics_page_index)) {
      return 1;
    }
    if (location.startsWith(chat_page_index)) {
      return 2;
    }
    if (location.startsWith(personal_page_index)) {
      return 3;
    }
    if (location.startsWith(about_page_index)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(home_page_route);
        break;
      case 1:
        GoRouter.of(context).go(topics_page_index);
        break;
      case 2:
        GoRouter.of(context).go(chat_page_index);
        break;
      case 3:
        GoRouter.of(context).go(personal_page_index);
        break;
      case 4:
        GoRouter.of(context).go(about_page_index);
        break;
    }
  }
}
