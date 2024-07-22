import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:untitled7/Repository/API/Cap_User_Api.dart';

import '../../Repository/Model_Class/Cap_User_Model.dart';
import 'cap_user_bloc.dart';

part 'cap_user_event.dart';

part 'cap_user_state.dart';

class CapUserBloc extends Bloc<CapUserEvent, CapUserState> {
  UserApi userApi = UserApi();
  late CapUser userModel;

  CapUserBloc() : super(CapUserInitial()) {
    on<CapUserEvent>((event, emit) async {
      emit(CapUserBloCLoading());
      try {
        userModel = await userApi.getUser(
          userName: '',
          phoneNumber: '',
          gender: '',
          email: '',
          userRole: '',
          facilityId: '',
        );
        emit(CapUserBLoCLoaded());
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(CapUserBloCError());
      }
    });
  }
}
