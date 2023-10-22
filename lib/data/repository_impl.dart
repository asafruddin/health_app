import 'package:health_app/data/datasource/remote_source.dart';
import 'package:health_app/data/model/login_model.dart';
import 'package:health_app/domain/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteSource remote;

  RepositoryImpl({required this.remote});

  @override
  Future<String> login(String email, String password) async {
    try {
      final result = await remote
          .login(LoginRequestBody(email: email, password: password));
      return result.token ?? '';
    } catch (e) {
      rethrow;
    }
  }
}
