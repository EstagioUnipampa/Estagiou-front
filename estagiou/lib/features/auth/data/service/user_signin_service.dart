import 'package:dio/dio.dart';

class UserAuthService {
  final Dio _dio;

  UserAuthService(this._dio);

  Future<int> login({required LoginDTO login}) async {
    final response = await _dio.post(
      'http://10.0.2.2:8080/v1/auth/login',
      data: login.toMap(),
    );
    if (response.statusCode == 200) {
      print('Login realizado com sucesso');
    } else {
      print('Erro ao autenticar aluno: ${response.statusCode.toString()}');
    }
    return response.statusCode ?? 404;
  }
}

class LoginDTO {
  final String email;
  final String password;

  LoginDTO({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
    };
  }
}
