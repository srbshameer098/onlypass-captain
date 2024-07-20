part of 'all_event_bloc.dart';

@immutable
sealed class AllEventEvent {}
class FetchAllEvent extends AllEventEvent {
}