import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../Repository/API/Event_Api.dart';
import '../../Repository/Model_Class/Event_model.dart';

part 'event_event.dart';

part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventApi eventApi = EventApi();
  late EventModel eventModel;

  EventBloc() : super(EventInitial()) {
    on<FetchEvent>((event, emit) async {
      emit(EventBloCLoading());
      try {
        eventModel = await eventApi.getEvent(
          name: event.name,
          facility: event.facility,
          description: event.description,
          image: event.image,
          eventLeader: event.eventLeader,
          startDate: event.startDate,
          endDate: event.endDate,
          fee: event.fee,
          amount: event.amount,
          availableSlot: event.availableSlot,
          repeatEndDate: event.repeatEndDate,
          repetDays: event.repetDays,
          eventAddress: event.eventAddress,
          eventLat_Long: event.eventLat_Long,
          id: event.id,
          createdAt: event.createdAt,
          updatedAt: event.updatedAt,
          v: event.v,
        );
        emit(EventBLoCLoaded());
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(EventBloCError());
      }
    });
  }
}