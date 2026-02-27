import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_trading_community_ui/constants/app_colors.dart';
import 'package:social_trading_community_ui/constants/app_strings.dart';

class CommunityPostCard extends StatelessWidget {
  const CommunityPostCard({
    super.key,
    required this.categoryTitle,
    required this.categoryIconAsset,
    required this.followerCount,
    required this.highlightText,
    required this.headline,
    required this.likeCount,
  });

  final String categoryTitle;
  final String categoryIconAsset;
  final String followerCount;
  final String highlightText;
  final String headline;
  final String likeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.communityCardGradient,
          stops: [0.0, 0.35, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.grey,
                child: Image.asset(
                  categoryIconAsset,
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  categoryTitle,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.people_outline_rounded,
                      color: AppColors.yellow,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      followerCount,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          RichText(
            text: TextSpan(
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: AppColors.white,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: '$highlightText: ',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGreen,
                  ),
                ),
                TextSpan(
                  text: headline,
                  style: const TextStyle(color: AppColors.white70),
                ),
                TextSpan(
                  text: ' ${AppStrings.readMore}',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    color: AppColors.yellow,
                  ),
                ),
              ],
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 25),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user_avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      AppStrings.commentsHere,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        color: AppColors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(Icons.thumb_up_outlined, color: AppColors.white70, size: 18),
              const SizedBox(width: 6),
              Text(
                likeCount,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  color: AppColors.white70,
                ),
              ),
              const SizedBox(width: 16),

              Icon(Icons.share_outlined, color: AppColors.white70, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
