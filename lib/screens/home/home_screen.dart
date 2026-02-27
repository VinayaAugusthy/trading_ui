import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_trading_community_ui/constants/app_colors.dart';
import 'package:social_trading_community_ui/constants/app_strings.dart';
import 'package:social_trading_community_ui/screens/home/widgets/top_trader_carousel.dart';
import 'package:social_trading_community_ui/screens/home/widgets/home_header.dart';
import 'package:social_trading_community_ui/screens/home/widgets/following_card.dart';
import 'package:social_trading_community_ui/screens/home/widgets/home_tab_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _tabs = ['News feed', 'Top Traders', 'Following'];
  int _activeTab = 1;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: screenHeight),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: AppColors.backgroundGradient,
            center: Alignment.topLeft,
            radius: 3.0,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            children: [
              HomeHeader(),
              const SizedBox(height: 30),
              _buildActionPill(),
              const SizedBox(height: 20),
              HomeTabRow(
                tabs: _tabs,
                activeIndex: _activeTab,
                onTabChanged: (index) => setState(() => _activeTab = index),
              ),
              const SizedBox(height: 16),
              _buildTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.white10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.postActivity,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.white70,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
            icon: Image.asset(
              'assets/icons/attachment.png',
              width: 24,
              height: 24,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 6),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
            icon: Image.asset(
              'assets/icons/photo.png',
              width: 24,
              height: 24,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_activeTab) {
      case 0:
        return _buildNewsFeedCard();
      case 2:
        return const FollowingCard();
      case 1:
      default:
        return const TopTraderCarousel();
    }
  }

  Widget _buildNewsFeedCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF10263C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily pulse',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Stay up to date with the latest trader posts',
            style: GoogleFonts.plusJakartaSans(color: AppColors.white70),
          ),
        ],
      ),
    );
  }
}
