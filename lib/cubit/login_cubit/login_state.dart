part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();

  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String error;
  const LoginError(this.error);

  @override
  List<Object> get props => [error];
}

class LoginSuccess extends LoginState {
  const LoginSuccess();

  @override
  List<Object> get props => [];
}