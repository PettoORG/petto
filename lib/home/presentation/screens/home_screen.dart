import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/home/presentation/widgets/calendar_view.dart';
import 'package:petto/home/presentation/widgets/profile_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          () {
            switch (_index) {
              case 0:
                return 'Inicio';
              case 1:
                return 'Recordatorios';
              case 2:
                return 'Calendario';
              case 3:
                return 'Perfil';
              default:
                return '';
            }
          }(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (i) => setState(() => _index = i),
        children: const [
          Center(child: Text('HomeScreen')),
          SizedBox.shrink(),
          CalendarView(),
          ProfileView(),
        ],
      ),

      // ---------- Bottom Navigation ----------
      bottomNavigationBar: SafeArea(
        child: Container(
          color: colorScheme.surface,
          padding: EdgeInsets.symmetric(
            vertical: size.height * AppThemeSpacing.extraTiny,
            horizontal: size.width * AppThemeSpacing.medium,
          ),
          child: GNav(
            selectedIndex: _index,
            onTabChange: (i) {
              setState(() => _index = i);
              _pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            gap: 0,
            padding: const EdgeInsets.all(12),
            rippleColor: colorScheme.primaryContainer,
            hoverColor: colorScheme.primaryContainer,
            duration: Duration.zero,
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
