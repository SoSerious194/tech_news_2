import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tech_news_2/screens/get_started.dart';
import 'package:tech_news_2/screens/home_page.dart';
import 'package:tech_news_2/utils/app_colors.dart';
import 'package:tech_news_2/utils/app_methods.dart';
import 'package:tech_news_2/utils/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TechNews());
}

class TechNews extends StatelessWidget {
  const TechNews({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.whiteColor,
        accentColor: AppColors.accentColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
        bottomAppBarColor: AppColors.whiteColor,
        brightness: Brightness.light,
        indicatorColor: AppColors.primaryColor,
      ),
      darkTheme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        scaffoldBackgroundColor: AppColors.primaryColor,
        bottomAppBarColor: AppColors.primaryColor,
        brightness: Brightness.dark,
        indicatorColor: AppColors.whiteColor,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home:
          AppMethods.isSignedIn() ? const HomePage() : const GetStartedPage(),
    );
  }
}
