import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  /// to nav to specific not from nav bar
  void navToSpecificPage({required int pageIndex}) {
    setState(() {
      _selectedIndex == pageIndex;
    });
  }

  static const List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Categories', style: TextStyle(fontSize: 24))),
    Center(child: Text('Favorites', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.surface,
          boxShadow: [BoxShadow(blurRadius: 20, color: theme.secondary)],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: theme.secondary,
              hoverColor: theme.secondary,
              haptic: true,
              gap: 8,
              activeColor: theme.secondary,
              iconSize: 24,
              textStyle: TextStyle(fontFamily: 'Podkova', fontSize: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: theme.primary,
              color: theme.onSecondary,
              tabs: const [
                GButton(icon: Icons.home_outlined, text: 'Home'),
                GButton(icon: Icons.grid_view_outlined, text: 'Categories'),
                GButton(icon: Icons.favorite_border, text: 'Favorites'),
                GButton(icon: Icons.person_outline, text: 'Profile'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
