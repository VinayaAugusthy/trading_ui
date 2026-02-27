import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_trading_community_ui/constants/app_colors.dart';
import 'package:social_trading_community_ui/constants/app_strings.dart';

class FollowingCard extends StatelessWidget {
  const FollowingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.followingCardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.white24,
                child: const Icon(Icons.person, color: AppColors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                AppStrings.followingPrimaryUserName,
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.followingDescription,
            style: GoogleFonts.plusJakartaSans(color: AppColors.white70),
          ),
        ],
      ),
    );
  }
}
