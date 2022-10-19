part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {
  const BookmarkInitial();

  @override
  List<Object> get props => [];
}

class BookmarkSaved extends BookmarkState {
  const BookmarkSaved();

  @override
  List<Object> get props => [];
}

class BookmarkRemoved extends BookmarkState {
  const BookmarkRemoved();

  @override
  List<Object> get props => [];
}

class Bookmarked extends BookmarkState {
  const Bookmarked();

  @override
  List<Object> get props => [];
}
