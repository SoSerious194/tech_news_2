part of 'rss_cubit.dart';

abstract class RssState extends Equatable {
  const RssState();

  @override
  List<Object> get props => [];
}

class RssInitial extends RssState {
  const RssInitial();

  @override
  List<Object> get props => [];
}

class RssLoading extends RssState {
  const RssLoading();

  @override
  List<Object> get props => [];
}

class RssLoaded extends RssState {
  final RssFeed feed;
  const RssLoaded(this.feed);

  @override
  List<Object> get props => [feed];
}

class RssError extends RssState {
  final String error;
  const RssError(this.error);

  @override
  List<Object> get props => [error];
}
