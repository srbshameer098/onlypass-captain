part of 'all_event_bloc.dart';

@immutable
sealed class AllEventState {}

final class AllEventInitial extends AllEventState {}

class AllEventBlocLoading extends AllEventState {}

class AllEventBlocLoaded extends AllEventState {}

class AllEventBlocError extends AllEventState {}
