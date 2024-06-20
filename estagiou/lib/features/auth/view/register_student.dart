import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/features/auth/data/service/user_signup_service.dart';
import 'package:flutter_application_1/features/auth/view/auth_student.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_application_1/features/auth/view/bloc/sign_up_bloc/sign_up_events.dart';
import 'package:flutter_application_1/features/auth/view/components/login_text_field.dart';
import 'package:flutter_application_1/shared/bloc/base_state.dart';
import 'package:flutter_application_1/shared/utils/feedback_overlay.dart';
import 'package:flutter_application_1/theme/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  late SignUpBloc _signUpBloc;

  String? _emailError;
  String? _passwordError;
  String? _firstNameError;
  String? _lastNameError;

  @override
  void initState() {
    _signUpBloc = Modular.get<SignUpBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    bool isValid = true;

    setState(() {
      _emailError = null;
      _passwordError = null;
      _firstNameError = null;
      _lastNameError = null;

      if (_firstNameController.text.isEmpty) {
        _firstNameError = 'O campo nome é obrigatório';
        isValid = false;
      }

      if (_lastNameController.text.isEmpty) {
        _lastNameError = 'O campo sobrenome é obrigatório';
        isValid = false;
      }

      if (_emailController.text.isEmpty) {
        _emailError = 'O campo email é obrigatório';
        isValid = false;
      } else if (!_emailController.text.contains('@gmail.com')) {
        _emailError = 'Insira um email válido (@gmail.com)';
        isValid = false;
      }

      if (_passwordController.text.isEmpty) {
        _passwordError = 'O campo senha é obrigatório';
        isValid = false;
      } else if (_passwordController.text.length < 6) {
        _passwordError = 'A senha deve ter pelo menos 6 caracteres';
        isValid = false;
      }
    });

    return isValid;
  }

  void _register() {
    if (_validateForm()) {
      Aluno alunoDTO = Aluno(
        address: null,
        course: null,
        enrollments: [],
        enrollmentsEmpty: true,
        id: '',
        quantityEnrollments: 0,
        role: 'USER',
        email: _emailController.text,
        name: _firstNameController.text,
        lastName: _lastNameController.text,
        password: _passwordController.text,
      );
      _signUpBloc.add(OnSignUpEvent(alunoDTO: alunoDTO));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AuthStudent()),
          ),
        ),
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
        backgroundColor: const Color(0xFF23A331),
      ),
      body: BlocConsumer<SignUpBloc, BaseState>(
        listener: (context, state) {
          if (state is ErrorState) {
            FeedbackOverlay.show(context, FeedbackTypesEnum.error);
          } else if (state is SuccessState) {
            FeedbackOverlay.show(context, FeedbackTypesEnum.success);
          } else if (state is LoadingState) {
            FeedbackOverlay.show(context, FeedbackTypesEnum.loading);
          }
        },
        bloc: _signUpBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(28, 10, 28, 0),
              color: const Color(0xFFFBF6FF),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF1A7924),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Realize o cadastro da sua conta:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                    50.ph,
                    SizedBox(
                      height: 75,
                      child: LoginTextField(
                        labelText: 'Nome',
                        controller: _firstNameController,
                        isPassword: false,
                        errorText: _firstNameError,
                      ),
                    ),
                    1.ph,
                    SizedBox(
                      height: 75,
                      child: LoginTextField(
                        labelText: 'Sobrenome',
                        controller: _lastNameController,
                        isPassword: false,
                        errorText: _lastNameError,
                      ),
                    ),
                    1.ph,
                    SizedBox(
                      height: 75,
                      child: LoginTextField(
                        labelText: 'Email',
                        controller: _emailController,
                        isPassword: false,
                        errorText: _emailError,
                      ),
                    ),
                    1.ph,
                    SizedBox(
                      height: 75,
                      child: LoginTextField(
                        labelText: 'Senha',
                        controller: _passwordController,
                        isPassword: true,
                        errorText: _passwordError,
                      ),
                    ),
                    20.ph,
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Palette.lightGreen,
                          padding: const EdgeInsets.all(24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: _register,
                        child: Text(
                          'Cadastrar',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                        ),
                      ),
                    ),
                    20.ph,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
