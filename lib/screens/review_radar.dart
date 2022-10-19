import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/app_extras.dart';
import '../utils/app_strings.dart';
import '../utils/app_styles.dart';
import '../widgets/progress_indicator.dart';
import 'news_detail.dart';

class ReviewRadarTab extends StatefulWidget {
  const ReviewRadarTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewRadarTab> createState() => _ReviewRadarTabState();
}

class _ReviewRadarTabState extends State<ReviewRadarTab> {
  StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>();
  List<DocumentSnapshot> news = [];

  bool isRequesting = false;
  bool isFinish = false;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('tech_news')
        .snapshots()
        .listen((data) => onChangeData(data.docChanges));

    requestNextPage();
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  void onChangeData(List<DocumentChange> documentChanges) {
    var isChange = false;
    // ignore: avoid_function_literals_in_foreach_calls
    documentChanges.forEach((newsChange) {
      if (newsChange.type == DocumentChangeType.removed) {
        news.removeWhere((singleNews) {
          return newsChange.doc.id == singleNews.id;
        });
        isChange = true;
      } else {
        if (newsChange.type == DocumentChangeType.modified) {
          int indexWhere = news.indexWhere((singleNews) {
            return newsChange.doc.id == singleNews.id;
          });

          if (indexWhere >= 0) {
            news[indexWhere] = newsChange.doc;
          }
          isChange = true;
        }
      }
    });

    if (isChange) {
      streamController.add(news);
    }
  }

  void requestNextPage() async {
    if (!isRequesting && !isFinish) {
      QuerySnapshot querySnapshot;
      isRequesting = true;
      if (news.isEmpty) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('tech_news')
            .orderBy('timestamp', descending: true)
            .limit(10)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('tech_news')
            .orderBy('timestamp', descending: true)
            .startAfterDocument(news[news.length - 1])
            .limit(5)
            .get();
      }

      int oldSize = news.length;
      news.addAll(querySnapshot.docs);
      int newSize = news.length;
      if (oldSize != newSize) {
        streamController.add(news);
      } else {
        isFinish = true;
      }
      isRequesting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 8),
        Expanded(
          child: NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.maxScrollExtent ==
                  scrollInfo.metrics.pixels) {
                requestNextPage();
              }
              return true;
            },
            child: StreamBuilder<List<DocumentSnapshot>>(
              stream: streamController.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      AppStrings.newsError,
                      style: AppStyles.mediumTextStyleBold,
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      AppStrings.noNews,
                      style: AppStyles.mediumTextStyleBold,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: ListTile(
                        onTap: () {
                          AppExtras.push(
                            context,
                            NewsDetailPage(doc: snapshot.data![index]),
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data?[index]['image'],
                            fit: BoxFit.cover,
                            height: 62,
                            width: 62,
                          ),
                        ),
                        title: Text(
                          snapshot.data?[index]['headline'],
                          style: AppStyles.newsTitleStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          snapshot.data?[index]['date'],
                          style: AppStyles.newsDateStyle,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
