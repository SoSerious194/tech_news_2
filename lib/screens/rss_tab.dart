import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tech_news_2/cubit/rss/rss_cubit.dart';
import 'package:tech_news_2/screens/web_view.dart';
import 'package:tech_news_2/utils/app_extras.dart';
import 'package:tech_news_2/utils/app_strings.dart';
import 'package:tech_news_2/widgets/progress_indicator.dart';
import '../utils/app_styles.dart';

class RssTab extends StatelessWidget {
  final String rssUrl;
  const RssTab({
    Key? key,
    required this.rssUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RssCubit()..loadRss(rssUrl),
      child: BlocBuilder<RssCubit, RssState>(
        builder: (context, state) {
          if (state is RssLoading) {
            return const CustomProgressIndicator();
          }
          if (state is RssError) {
            return Center(
              child: Text(
                AppStrings.error,
                style: AppStyles.smallTextStyle,
              ),
            );
          }
          if (state is RssLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.feed.items?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String date = "";
                      final DateFormat formatter = DateFormat('MMM dd, yyyy');

                      if (state.feed.items![index].pubDate != null) {
                        date =
                            formatter.format(state.feed.items![index].pubDate!);
                      }
                      return Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        child: ListTile(
                          onTap: () {
                            AppExtras.push(
                              context,
                              RssWebViewPage(
                                  url: state.feed.items![index].link!),
                            );
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl:
                                  state.feed.items![index].media != null &&
                                          state.feed.items![index].media!
                                                  .contents !=
                                              null &&
                                          state.feed.items![index].media!
                                              .contents!.isNotEmpty
                                      ? state.feed.items![index].media!
                                          .contents!.first.url!
                                      : state.feed.image!.url!,
                              fit: BoxFit.cover,
                              height: 62,
                              width: 62,
                            ),
                          ),
                          title: Text(
                            state.feed.items![index].title ?? "",
                            style: AppStyles.newsTitleStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            date != ""
                                ? date
                                : state.feed.items![index].author ?? "",
                            style: AppStyles.newsDateStyle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const CustomProgressIndicator();
        },
      ),
    );
  }
}
