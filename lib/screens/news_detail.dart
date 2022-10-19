import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_news_2/cubit/bookmark/bookmark_cubit.dart';
import 'package:tech_news_2/utils/app_colors.dart';
import 'package:tech_news_2/utils/app_extras.dart';
import 'package:tech_news_2/utils/app_strings.dart';
import 'package:tech_news_2/utils/app_styles.dart';
import 'package:tech_news_2/widgets/custom_appbar.dart';

class NewsDetailPage extends StatelessWidget {
  final DocumentSnapshot doc;
  const NewsDetailPage({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookmarkCubit()..checkExists(doc),
      child: Scaffold(
        appBar: CustomAppBar(
          color: Colors.transparent,
          title: AppStrings.article,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => AppExtras.pop(context),
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 20,
              color: Theme.of(context).indicatorColor,
            ),
          ),
          actions: [BookmarkButton(doc: doc)],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 4,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
                child: Text(
                  doc['headline'],
                  style: AppStyles.contentStyleBold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.by,
                            style: AppStyles.contentStyleSmall,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppStrings.reviewRadar,
                            style: AppStyles.authorStyle,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            " |  ${doc['date']}",
                            style: AppStyles.contentStyleSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: doc['image'],
                          width: double.infinity,
                          height: 222,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 22),
                      SelectableText(
                        doc['story'],
                        style: AppStyles.storyStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 22),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  final DocumentSnapshot doc;
  const BookmarkButton({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookmarkCubit = BlocProvider.of<BookmarkCubit>(context);

    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        if (state is BookmarkSaved) {
          return IconButton(
            onPressed: () => bookmarkCubit.removeBookmark(doc),
            icon: FaIcon(
              FontAwesomeIcons.check,
              color: AppColors.accentColor,
              size: 20,
            ),
          );
        }
        if (state is Bookmarked) {
          return IconButton(
            onPressed: () => bookmarkCubit.removeBookmark(doc),
            icon: FaIcon(
              FontAwesomeIcons.check,
              color: AppColors.accentColor,
              size: 20,
            ),
          );
        }
        return IconButton(
          onPressed: () => bookmarkCubit.saveBookMark(doc),
          icon: FaIcon(
            FontAwesomeIcons.bookmark,
            size: 20,
            color: Theme.of(context).indicatorColor,
          ),
        );
      },
    );
  }
}
