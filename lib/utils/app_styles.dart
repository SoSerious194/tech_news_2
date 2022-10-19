import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_2/utils/app_colors.dart';

class AppStyles {
  static TextStyle headingStyle = GoogleFonts.newsreader(
    color: AppColors.whiteColor,
    fontSize: 38,
    fontWeight: FontWeight.bold,
  );

  static TextStyle contentStyle = GoogleFonts.newsreader(
    color: AppColors.whiteColor,
    fontSize: 22,
  );

  static TextStyle contentStyleBold = GoogleFonts.newsreader(
    color: AppColors.whiteColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle contentStyleSmall = GoogleFonts.newsreader(
    color: AppColors.whiteColor,
    fontSize: 14,
  );

  static TextStyle authorStyle = GoogleFonts.newsreader(
    color: AppColors.accentColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle storyStyle = GoogleFonts.newsreader(
    color: AppColors.whiteColor,
    fontSize: 18,
  );

  static TextStyle buttonStyle = GoogleFonts.sourceSansPro(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallTextStyle = GoogleFonts.sourceCodePro(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle mediumTextStyleBold = GoogleFonts.sourceSansPro(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  static TextStyle smallTextStyleBold = GoogleFonts.sourceCodePro(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static TextStyle tabStyle = GoogleFonts.sourceSansPro(
    color: Colors.transparent,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    shadows: const [
      Shadow(
        color: Colors.white,
        offset: Offset(0, -10),
      ),
    ],
    decoration: TextDecoration.underline,
  );

  static TextStyle newsTitleStyle = GoogleFonts.newsreader(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle newsDateStyle = GoogleFonts.newsreader(
    color: Colors.white60,
    fontSize: 14,
  );
}
