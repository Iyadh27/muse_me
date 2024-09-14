import 'package:get_it/get_it.dart';
import 'package:muse_me/data/repository/auth/auth_repository_impl.dart';
import 'package:muse_me/data/sources/auth/auth_firebase_service.dart';
import 'package:muse_me/domain/repository/auth/auth.dart';
import 'package:muse_me/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  // sl.registerLazySingleton<AuthFirebaseService>(() => AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
