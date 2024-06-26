import 'package:flutter_application_1/features/auth/data/service/user_signup_service.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_application_1/features/auth/view/register_student.dart';
import 'package:flutter_application_1/shared/module/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/service/user_signin_service.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const RegisterStudent(),
    );
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.add(UserSignupService.new);
    i.addSingleton<SignUpBloc>(SignUpBloc.new);
    i.add(UserAuthService.new);
    i.addSingleton<SignInBloc>(SignInBloc.new);
  }
}
