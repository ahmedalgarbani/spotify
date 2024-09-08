import 'package:get_it/get_it.dart';
import 'package:spotify/features/authentiaction/data/services/firebase_auth_services.dart';
import 'package:spotify/features/authentiaction/presentation/usecase/auth/register.dart';
import 'package:spotify/features/authentiaction/presentation/usecase/auth/signin.dart';
import 'package:spotify/features/authentiaction/presentation/view_model/repository/repo_auth.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<AuthRepository>(AuthRepoImpl());

  sl.registerSingleton<FirebaseAuthServices>(FirebaseAuthServicesImpl());

  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  
  sl.registerSingleton<SignInUSeCase>(SignInUSeCase());
}
