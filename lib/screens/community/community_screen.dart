import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_trading_community_ui/constants/app_colors.dart';
import 'package:social_trading_community_ui/constants/app_strings.dart';
import 'package:social_trading_community_ui/screens/community/widgets/community_post_card.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 100,
                ),
                children: [
                  CommunityPostCard(
                    categoryTitle: AppStrings.tradingAndBusinessNews,
                    categoryIconAsset: 'assets/images/cooperation.png',
                    followerCount: '234',
                    highlightText: AppStrings.breakingNewsLabel,
                    headline: AppStrings.breakingNewsHeadline,
                    likeCount: '34',
                  ),
                  SizedBox(height: 16),
                  CommunityPostCard(
                    categoryTitle: AppStrings.todayMarketUpdate,
                    categoryIconAsset: 'assets/images/market_fluctuation.png',
                    followerCount: '234',
                    highlightText: AppStrings.todayUpdateNewsLabel,
                    headline: AppStrings.todayUpdateHeadline,
                    likeCount: '64',
                  ),
                  SizedBox(height: 16),
                  CommunityPostCard(
                    categoryTitle: AppStrings.tradingAndBusinessNews,
                    categoryIconAsset: 'assets/images/cooperation.png',
                    followerCount: '234',
                    highlightText: AppStrings.breakingNewsLabel,
                    headline: AppStrings.breakingNewsHeadline,
                    likeCount: '34',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.grey,
            child: IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.white70,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ),

          Expanded(
            child: Text(
              AppStrings.community,
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.grey,
            child: Icon(Icons.notifications_outlined, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.white10),
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/search.png', width: 24, height: 24),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
                cursorColor: AppColors.white,
                decoration: InputDecoration(
                  hintText: AppStrings.searchHere,
                  hintStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white70,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(width: 6),
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(),
              icon: Image.asset(
                'assets/icons/filter.png',
                width: 24,
                height: 24,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
