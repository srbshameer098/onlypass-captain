part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}
class FetchLogin extends LogInEvent {
  final String phoneNumber ;
  FetchLogin({ required this.phoneNumber});
}