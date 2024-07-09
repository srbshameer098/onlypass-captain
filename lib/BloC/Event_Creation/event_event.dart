part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}
class FetchEvent extends EventEvent {
  final String name;
  final String facility;
  final String description;
  final String image;
  final String eventLeader;
  final String startDate;
  final String endDate;
  final bool fee;
  final String amount;
  final String availableSlot;
  final String repeatEndDate;
  final List<String> repetDays;
  final String eventAddress;
  final String eventLat_Long;
  final String id;
  final String createdAt;
  final String updatedAt;
  final String v;

FetchEvent({
  required this.name,
  required this.facility,
  required this.description,
  required this.image,
  required this.eventLeader,
  required this.startDate,
  required this.endDate,
  required this.fee,
  required this.amount,
  required this.availableSlot,
  required this.repeatEndDate,
  required this.repetDays,
  required this.eventAddress,
  required this.eventLat_Long,
  required this.id,
  required this.createdAt,
  required this.updatedAt,
  required this.v,
});
}