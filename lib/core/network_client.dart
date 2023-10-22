import 'package:dio/dio.dart';

class NetworkClient {
  Dio get dio {
    final option = BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 30000),
      receiveDataWhenStatusError: true,
    );

    final dio = Dio(option);

    return dio;
  }
}
