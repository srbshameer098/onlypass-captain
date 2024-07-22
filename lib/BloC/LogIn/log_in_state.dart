part of 'log_in_bloc.dart';

@immutable
abstract class LogInState {}

class LogInInitial extends LogInState {}

class LoginblocLoading extends LogInState {}

class LoginblocLoaded extends LogInState {
  final LogInModel response;
  LoginblocLoaded(this.response);
}

class LoginblocError extends LogInState {
  final String error;
  LoginblocError({required this.error});
}
