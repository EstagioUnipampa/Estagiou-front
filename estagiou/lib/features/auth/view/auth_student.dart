import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/data/service/user_signin_service.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_in_bloc/sign_in_events.dart';
import 'package:flutter_application_1/features/auth/view/components/login_text_field.dart';
import 'package:flutter_application_1/features/auth/view/register_student.dart';
import 'package:flutter_application_1/features/home/view/home_page.dart';
import 'package:flutter_application_1/theme/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/bloc/base_state.dart';

class AuthStudent extends StatefulWidget {
  const AuthStudent({Key? key}) : super(key: key);

  @override
  State<AuthStudent> createState() => _AuthStudentState();
}

class _AuthStudentState extends State<AuthStudent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late SignInBloc _bloc;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _bloc = Modular.get<SignInBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Modular.to.navigate('/')),
        toolbarHeight: 65,
        title: const Text(
          'Estudante',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Palette.lightGreen,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 10, 28, 0),
        color: Palette.whiteColor,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  color: Palette.primaryColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Realize o login na sua conta:',
                style: TextStyle(
                  fontSize: 16,
                  color: Palette.darkGrey,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                LoginTextField(
                    labelText: 'Email',
                    controller: _emailController,
                    isPassword: false),
                const SizedBox(height: 20),
                LoginTextField(
                    labelText: 'Senha',
                    controller: _passwordController,
                    isPassword: true),
                const SizedBox(height: 30),
                BlocConsumer<SignInBloc, BaseState>(
                    bloc: _bloc,
                    listener: (context, state) {
                      if (state is SuccessState<Future<int>>) {
                        state.data.then((value) {
                          if (value == 200) {
                            Modular.to.navigate('/home');
                          }
                        });
                        // Modular.to.navigate('/home'); // Navigate to home page
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          LoginDTO loginDTO = LoginDTO(
                              email: _emailController.text,
                              password: _passwordController.text);
                          _bloc.add(OnSignInEvent(loginDTO: loginDTO));
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }),
              ],
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterStudent()),
                );
              },
              child: Text(
                'Não possui conta? Cadastre-se',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, color: Palette.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
