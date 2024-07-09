part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
final class LoginblocLoading extends LogInState {}
final class LoginblocLoaded extends LogInState {}
final class LoginblocError extends LogInState {}