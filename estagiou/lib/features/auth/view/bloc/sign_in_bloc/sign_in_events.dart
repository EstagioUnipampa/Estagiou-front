import 'package:flutter_application_1/features/auth/data/service/user_signin_service.dart';
import 'package:flutter_application_1/features/auth/data/service/user_signup_service.dart';

abstract class SignInEvent {}

class OnSignInEvent extends SignInEvent {
  final LoginDTO loginDTO;

  OnSignInEvent({required this.loginDTO});
}

class OnGetLoginEvent extends SignInEvent {
  OnGetLoginEvent();
}
