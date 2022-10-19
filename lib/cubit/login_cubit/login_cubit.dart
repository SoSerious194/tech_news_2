import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_news_2/utils/app_strings.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  Future<void> signInAnonymously() async {
    try {
      emit(const LoginLoading());
      FirebaseAuth.instance.signInAnonymously().then((userCredential) {
        if (userCredential.user != null) {
          emit(const LoginSuccess());
        } else {
          emit(LoginError(AppStrings.loginError));
        }
      });
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
