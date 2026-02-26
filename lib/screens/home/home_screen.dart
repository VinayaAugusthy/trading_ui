// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_trading_community_ui/constants/app_colors.dart';
import 'package:social_trading_community_ui/constants/app_strings.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _BuildHeader(),
                  const SizedBox(height: 20),
                  _buildActionPill(),
                  const SizedBox(height: 20),
                  _buildTabRow(),
                  const SizedBox(height: 16),
                  _buildTabContent(),
                ],
              ),
            ),
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

  Widget _buildTabRow() {
    return Row(
      children: List.generate(_tabs.length, (index) {
        final isActive = _activeTab == index;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _activeTab = index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  _tabs[index],
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.yellow : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTabContent() {
    switch (_activeTab) {
      case 0:
        return _buildNewsFeedCard();
      case 2:
        return _buildFollowingCard();
      case 1:
      default:
        return _buildTopTraderCard();
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

  Widget _buildTopTraderCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0D333E),
            Color.fromARGB(255, 46, 74, 115),
            Color.fromARGB(255, 130, 159, 196),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/google.png',
                    width: 36,
                    height: 36,
                  ),
                ),
              ),

              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFDE047),
                ),
                child: Text(
                  'Copy Trade',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '60%',
                style: GoogleFonts.plusJakartaSans(
                  color: Color.fromARGB(255, 130, 219, 179),
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                'High',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Exchange Rate:',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.white70,
                        ),
                      ),
                      Text(
                        '1.0750',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantity:',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.white70,
                        ),
                      ),
                      Text(
                        '10,000 ',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'units',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/trade_card_bg.png',
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B).withOpacity(0.7),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white24,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cameron Williamson',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Top trader',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.person_add,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Follow',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1B2C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white24,
                child: const Icon(Icons.person, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'Latasha Gibson',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Following these top traders keeps your feed curated.',
            style: GoogleFonts.plusJakartaSans(color: AppColors.white70),
          ),
        ],
      ),
    );
  }
}

class _BuildHeader extends StatelessWidget {
  const _BuildHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeBack,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            Text(
              AppStrings.userName,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.grey,
          child: Icon(Icons.notifications_outlined, color: AppColors.white),
        ),
      ],
    );
  }
}
