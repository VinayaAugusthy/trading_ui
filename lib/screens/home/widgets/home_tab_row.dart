import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_trading_community_ui/constants/app_colors.dart';

class HomeTabRow extends StatelessWidget {
  const HomeTabRow({
    super.key,
    required this.tabs,
    required this.activeIndex,
    required this.onTabChanged,
  });

  final List<String> tabs;
  final int activeIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isActive = activeIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tabs[index],
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    color: isActive ? AppColors.yellow : AppColors.white,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
