part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
final class LoginblocLoading extends LogInState {}
final class LoginblocLoaded extends LogInState {
  final LogInModel response;
  LoginblocLoaded(this.response);
}
final class LoginblocError extends LogInState {}