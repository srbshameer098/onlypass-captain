import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled7/Repository/API/LogIn-Api.dart';
import '../../Repository/Model_Class/Login_model.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {

  late LogInModel logInmodel;
  LogInApi loginApi = LogInApi();

  LogInBloc() : super(LogInInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(LoginblocLoading());
      try {
        logInmodel = await loginApi.getLogin(event.phoneNumber);
        emit(LoginblocLoaded(
            logInmodel
        ));
        print('Bloc loaded successfulyy........');
      } catch (e) {
        print('************e');
        emit(LoginblocError(error: e.toString()));
      }
    });
  }
}
