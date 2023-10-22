import 'package:health_app/domain/repository.dart';

class LoginUseCase {
  final Repository _repository;

  LoginUseCase({required Repository repository}) : _repository = repository;

  Future<String> execute(String email, String password) {
    return _repository.login(email, password);
  }
}
