part of 'cap_user_bloc.dart';

@immutable
sealed class CapUserEvent {}
class FetchEvent extends CapUserEvent {
  final String userName;
  final String phoneNumber;
  final String gender;
  final String email;
  final String userRole;
  final String facilityId;


  FetchEvent({
    required this.userName,
    required this.phoneNumber,
    required this.gender,
    required this.email,
    required this.userRole,
    required this.facilityId,

  });
}