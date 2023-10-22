import 'package:dio/dio.dart';
import 'package:health_app/data/model/login_model.dart';

class RemoteSource {
  final Dio dio;

  RemoteSource({required this.dio});

  Future<LoginResponseModel> login(LoginRequestBody body) async {
    try {
      final response = await dio.post('/login', data: body.toJson());
      return LoginResponseModel.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
