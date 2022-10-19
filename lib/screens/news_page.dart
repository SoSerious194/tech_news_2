import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_news_2/cubit/news/news_cubit.dart';
import 'package:tech_news_2/screens/rss_tab.dart';
import 'package:tech_news_2/utils/app_rss.dart';
import 'package:tech_news_2/utils/app_strings.dart';
import 'package:tech_news_2/utils/app_styles.dart';

import '../utils/app_colors.dart';
import 'review_radar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: Column(
        children: [
          const SizedBox(height: 22),
          SizedBox(
            height: 32,
            child: TabBar(
              isScrollable: true,
              indicatorColor: AppColors.accentColor,
              controller: tabController,
              tabs: [
                Text(
                  AppStrings.reviewRadar,
                  style: AppStyles.tabStyle,
                ),
                Text(
                  AppStrings.gadgets360,
                  style: AppStyles.tabStyle,
                ),
                Text(
                  AppStrings.androidAuthority,
                  style: AppStyles.tabStyle,
                ),
                Text(
                  AppStrings.fpt,
                  style: AppStyles.tabStyle,
                ),
                Text(
                  AppStrings.techCrunch,
                  style: AppStyles.tabStyle,
                ),
                Text(
                  AppStrings.liveMint,
                  style: AppStyles.tabStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                const ReviewRadarTab(),
                RssTab(rssUrl: AppRSS.gadgets360),
                RssTab(rssUrl: AppRSS.androidAuthority),
                RssTab(rssUrl: AppRSS.fpt),
                RssTab(rssUrl: AppRSS.techCrunch),
                RssTab(rssUrl: AppRSS.liveMint),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
