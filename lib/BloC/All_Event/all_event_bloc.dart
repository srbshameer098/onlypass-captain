import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/API/All_Event_Api.dart';
import '../../Repository/Model_Class/All_Event_Model.dart';



part 'all_event_event.dart';

part 'all_event_state.dart';

class AllEventBloc extends Bloc<AllEventEvent, AllEventState> {
  AllEventApi allEventApi = AllEventApi();
  late List<AllEventModel>  allEventModel;

  AllEventBloc() : super(AllEventInitial()) {
    on<FetchAllEvent>((event, emit) async {
      emit(AllEventBlocLoading());
      try {
        allEventModel = await allEventApi.getAllEvent();
        emit(AllEventBlocLoaded());
      } catch (e) {
        print(e);
        emit(AllEventBlocError());
      }
      // TODO: implement event handler
    });
  }
}