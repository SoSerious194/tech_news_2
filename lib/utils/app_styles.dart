import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_2/utils/app_colors.dart';

class AppStyles {
  static TextStyle headingStyle = GoogleFonts.newsreader(
    fontSize: 38,
    fontWeight: FontWeight.bold,
  );

  static TextStyle contentStyle = GoogleFonts.newsreader(
    fontSize: 22,
  );

  static TextStyle contentStyleBold = GoogleFonts.newsreader(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle contentStyleSmall = GoogleFonts.newsreader(
    fontSize: 14,
  );

  static TextStyle authorStyle = GoogleFonts.newsreader(
    color: AppColors.accentColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle storyStyle = GoogleFonts.newsreader(
    fontSize: 18,
  );

  static TextStyle buttonStyle = GoogleFonts.sourceSansPro(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallTextStyle = GoogleFonts.sourceCodePro(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle mediumTextStyleBold = GoogleFonts.sourceSansPro(
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  static TextStyle smallTextStyleBold = GoogleFonts.sourceCodePro(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static TextStyle tabStyle = GoogleFonts.sourceSansPro(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle newsTitleStyle = GoogleFonts.newsreader(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle newsDateStyle = GoogleFonts.newsreader(
    fontSize: 14,
  );
}
