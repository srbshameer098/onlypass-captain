import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled7/Repository/API/LogIn-Api.dart';

import '../../Repository/Model_Class/Login_model.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInApi loginApi =LogInApi();
  late LogInModel logInModel;
  LogInBloc() : super(LogInInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(LoginblocLoading());
      try{
        logInModel = await loginApi.getLogin(event.phoneNumber);
        emit(LoginblocLoaded());
      }catch(e){
        print(e);
        emit(LoginblocError());
      }
    });
  }
}
