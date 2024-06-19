import 'package:dio/dio.dart';

class UserAuthService {
  final Dio _dio;

  UserAuthService(this._dio);

  Future<void> login({required String email, required String password}) async {
    final response = await _dio.post(' ');
  } 
}