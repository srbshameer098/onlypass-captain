import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:untitled7/Repository/API/Event_Api.dart';

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
            event.name,
            event.facility,
            event.description,
            event.image,
            event.eventLeader,
            event.startDate,
            event.endDate,
            event.fee,
            event.amount,
            event.availableSlot,
            event.repeatEndDate,
            event.repetDays,
            event.eventAddress,
            event.eventLat_Long,
            event.id,
            event.createdAt,
            event.updatedAt,
            event.v
        );
        emit(EventBLoCLoaded());
      }
      catch(e){

        emit(EventBloCError());
      }
    });
  }
}
