part of 'event_bloc.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}
class EventBloCLoading extends EventState {}
class EventBLoCLoaded extends EventState {}
class EventBloCError extends EventState {}