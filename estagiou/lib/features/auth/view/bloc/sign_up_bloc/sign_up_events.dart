import 'package:flutter_application_1/features/auth/data/service/user_signup_service.dart';

abstract class SignUpEvent {}

class OnSignUpEvent extends SignUpEvent {
  final Aluno alunoDTO;

  OnSignUpEvent({required this.alunoDTO});
}

class OnGetAlunosEvent extends SignUpEvent {
  OnGetAlunosEvent();
}
