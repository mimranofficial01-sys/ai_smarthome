import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/screens/chat/chat.dart';
import 'package:ai_smart_home_design/screens/dashboard/dashboard.dart';
import 'package:ai_smart_home_design/screens/profile/profile.dart';
import 'package:ai_smart_home_design/screens/projects/projects.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int i = 0;

  static const _pages = [
    Dashboard(),
    Projects(),
    Chat(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktopOrTablet = MediaQuery.of(context).size.width >= 720;

    if (isDesktopOrTablet) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: i,
              onDestinationSelected: (v) => setState(() => i = v),
              labelType: NavigationRailLabelType.all,
              backgroundColor: navy,
              selectedIconTheme: const IconThemeData(color: cyan),
              selectedLabelTextStyle: const TextStyle(color: cyan, fontWeight: FontWeight.bold),
              unselectedIconTheme: const IconThemeData(color: Colors.white70),
              unselectedLabelTextStyle: const TextStyle(color: Colors.white70),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.folder_outlined),
                  selectedIcon: Icon(Icons.folder),
                  label: Text('Projects'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.auto_awesome_outlined),
                  selectedIcon: Icon(Icons.auto_awesome),
                  label: Text('AI'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: IndexedStack(
                index: i,
                children: _pages,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: i,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: i,
        onDestinationSelected: (v) => setState(() => i = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.folder), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.auto_awesome), label: 'AI'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
