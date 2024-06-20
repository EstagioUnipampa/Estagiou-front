import 'package:flutter_application_1/features/auth/view/bloc/sign_in_bloc/sign_in_events.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_up_bloc/sign_up_events.dart';
import 'package:flutter_application_1/shared/bloc/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/service/user_signin_service.dart';

class SignInBloc extends Bloc<SignInEvent, BaseState> {
  final UserAuthService _service;

  SignInBloc(this._service) : super(LoadingState()) {
    on<OnSignInEvent>((event, emit) async {
      emit(LoadingState());
      try {
        _service.login(email: event.email, password: event.password);
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    ;
  }
}
