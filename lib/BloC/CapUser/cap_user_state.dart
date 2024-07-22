part of 'cap_user_bloc.dart';

@immutable
sealed class CapUserState {}

final class CapUserInitial extends CapUserState {}
class CapUserBloCLoading extends CapUserState {}
class CapUserBLoCLoaded extends CapUserState {}
class CapUserBloCError extends CapUserState {}