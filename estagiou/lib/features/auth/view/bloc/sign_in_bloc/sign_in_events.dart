import 'package:flutter_application_1/features/auth/data/service/user_signup_service.dart';

abstract class SignInEvent {}

class OnSignInEvent extends SignInEvent {
  final String email;
  final String password;

  OnSignInEvent({required this.email, required this.password});
}

class OnGetLoginEvent extends SignInEvent {
  OnGetLoginEvent();
}
