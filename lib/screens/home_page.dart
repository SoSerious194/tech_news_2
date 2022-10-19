import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_news_2/screens/bookmark_page.dart';
import 'package:tech_news_2/screens/news_page.dart';
import 'package:tech_news_2/screens/settings_page.dart';
import 'package:tech_news_2/utils/app_colors.dart';
import 'package:tech_news_2/utils/app_strings.dart';
import 'package:tech_news_2/widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = const [
    NewsPage(),
    BookmarkPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: Colors.transparent,
        elevation: 0,
        title: AppStrings.appName,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 62,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            BottomNavigationBarItem(
              label: AppStrings.homeItem,
              icon: InkWell(
                onTap: () {
                  if (currentIndex != 0) {
                    setState(() {
                      currentIndex = 0;
                    });
                  }
                },
                child: FaIcon(
                  FontAwesomeIcons.house,
                  color: currentIndex == 0
                      ? AppColors.accentColor
                      : Theme.of(context).indicatorColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: AppStrings.savedItem,
              icon: InkWell(
                onTap: () {
                  if (currentIndex != 1) {
                    setState(() {
                      currentIndex = 1;
                    });
                  }
                },
                child: FaIcon(
                  FontAwesomeIcons.bookmark,
                  color: currentIndex == 1
                      ? AppColors.accentColor
                      : Theme.of(context).indicatorColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: AppStrings.settingsItem,
              icon: InkWell(
                onTap: () {
                  if (currentIndex != 2) {
                    setState(() {
                      currentIndex = 2;
                    });
                  }
                },
                child: FaIcon(
                  FontAwesomeIcons.circleInfo,
                  color: currentIndex == 2
                      ? AppColors.accentColor
                      : Theme.of(context).indicatorColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
