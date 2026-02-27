import 'package:flutter/material.dart';
import 'package:social_trading_community_ui/constants/app_colors.dart';
import 'package:social_trading_community_ui/constants/app_strings.dart';
import 'package:social_trading_community_ui/screens/community/community_screen.dart';
import 'package:social_trading_community_ui/screens/home/home_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  late final List<Widget> _pages = const <Widget>[
    HomeScreen(),
    CommunityScreen(),
    _PlaceholderScreen(title: AppStrings.chat),
    _PlaceholderScreen(title: AppStrings.settings),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.backgroundGradient.last,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: AppColors.backgroundGradient,
                  center: Alignment.topLeft,
                  radius: 3.0,
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: SizedBox(
              height: screenHeight,
              child: IndexedStack(index: _index, children: _pages),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16 + bottomPadding,
            child: _BottomNavBar(
              index: _index,
              onChanged: (value) => setState(() => _index = value),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.index, required this.onChanged});

  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.bottomNavBarColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(
            label: AppStrings.home,
            iconAsset: 'assets/icons/home.png',
            active: index == 0,
            onTap: () => onChanged(0),
          ),
          _NavItem(
            label: AppStrings.community,
            iconAsset: 'assets/icons/group.png',
            active: index == 1,
            onTap: () => onChanged(1),
          ),
          _NavItem(
            label: AppStrings.chat,
            iconAsset: 'assets/icons/chat.png',
            active: index == 2,
            onTap: () => onChanged(2),
          ),
          _NavItem(
            label: AppStrings.settings,
            iconData: Icons.settings_outlined,
            active: index == 3,
            onTap: () => onChanged(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    this.iconAsset,
    this.iconData,
    required this.active,
    required this.onTap,
  }) : assert(iconAsset != null || iconData != null);

  final String label;
  final String? iconAsset;
  final IconData? iconData;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = active ? AppColors.yellow : AppColors.white70;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.white10 : AppColors.transparent,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            if (iconAsset != null)
              Image.asset(iconAsset!, width: 20, height: 20, color: fg)
            else
              Icon(iconData!, color: fg, size: 24),
            if (active) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(color: fg, fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
