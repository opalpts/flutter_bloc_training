import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_training/bloc/login/login.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    // Username updated
    if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));

      // Password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      if (state.username == '1234' && state.password == '12345678') {
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } else {
        emit(state.copyWith(formStatus: SubmissionFailed('Login fail')));
      }
    }
  }
}
