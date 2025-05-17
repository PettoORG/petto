import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: const Center(child: Text('HomeScreen')),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: colorScheme.surface,
          padding: EdgeInsets.symmetric(
            vertical: size.height * AppThemeSpacing.tiny,
            horizontal: size.width * AppThemeSpacing.medium,
          ),
          child: GNav(
            selectedIndex: _index,
            onTabChange: (i) => setState(() => _index = i),
            gap: 0,
            padding: const EdgeInsets.all(12),
            rippleColor: colorScheme.primaryContainer,
            hoverColor: colorScheme.primaryContainer,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            activeColor: colorScheme.surface,
            tabBackgroundColor: colorScheme.primaryContainer,
            tabBorderRadius: 30,
            tabs: const [
              GButton(icon: Icons.home_rounded),
              GButton(icon: Icons.alarm_rounded),
              GButton(icon: Icons.calendar_month_rounded),
              GButton(icon: Icons.person_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
