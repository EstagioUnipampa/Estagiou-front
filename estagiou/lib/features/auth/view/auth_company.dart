import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/data/service/user_signin_service.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_in_bloc/sign_in_events.dart';
import 'package:flutter_application_1/features/auth/view/components/login_text_field.dart';
import 'package:flutter_application_1/features/auth/view/register_student.dart';
import 'package:flutter_application_1/theme/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/bloc/base_state.dart';

class AuthCompany extends StatefulWidget {
  const AuthCompany({Key? key}) : super(key: key);

  @override
  State<AuthCompany> createState() => _AuthCompanyState();
}

class _AuthCompanyState extends State<AuthCompany> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late SignInBloc _bloc;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        toolbarHeight: 65,
        title: const Text(
          'Empresa',
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.primaryColor,
        onPressed: () {
          _showInfoDialog(context);
        },
        child: const Icon(Icons.help_outline),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Informação',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Primeira vez no app? Entre em contato com a instituição de ensino e obtenha o login para a sua empresa.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
