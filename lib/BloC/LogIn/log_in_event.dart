part of 'log_in_bloc.dart';



@immutable
abstract class LogInEvent {}

class FetchLogin extends LogInEvent {
  final String phoneNumber;
  FetchLogin({required this.phoneNumber});
}
