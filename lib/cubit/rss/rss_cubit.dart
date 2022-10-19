import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

part 'rss_state.dart';

class RssCubit extends Cubit<RssState> {
  RssCubit() : super(const RssInitial());

  Future<void> loadRss(String url) async {
    emit(const RssLoading());
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(url));
      emit(RssLoaded(RssFeed.parse(response.body)));
    } catch (e) {
      emit(RssError(e.toString()));
    }
  }
}
