import 'package:dio/dio.dart';

import 'dio/dio_client.dart';

class AuthService {
  final DioClient client;
  AuthService({required this.client});

  Future<Response<dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      '/api/v1/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return response;
  }
}
