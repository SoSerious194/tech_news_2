import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsInitial());

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeSource(index));
  }
}
