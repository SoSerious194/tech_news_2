part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();

  @override
  List<Object> get props => [];
}

class ChangeSource extends NewsState {
  final int index;
  const ChangeSource(this.index);

  @override
  List<Object> get props => [index];
}
