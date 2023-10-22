import 'package:get_it/get_it.dart';
import 'package:health_app/core/network_client.dart';
import 'package:health_app/data/datasource/remote_source.dart';
import 'package:health_app/data/repository_impl.dart';
import 'package:health_app/domain/repository.dart';
import 'package:health_app/domain/usecase/login_usecase.dart';
import 'package:health_app/presentation/bloc/authentication/authentication_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NetworkClient());

  sl.registerLazySingleton(() => sl<NetworkClient>().dio);

  sl.registerFactory(() => RemoteSource(dio: sl()));

  sl.registerFactory<Repository>(() => RepositoryImpl(remote: sl()));

  sl.registerFactory(() => LoginUseCase(repository: sl()));

  sl.registerFactory(() => AuthenticationBloc(sl()));
}
