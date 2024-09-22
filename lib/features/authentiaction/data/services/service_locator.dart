import 'package:get_it/get_it.dart';
import 'package:spotify/features/pages/usecase/addorremoveusecase.dart';
import 'package:spotify/features/pages/usecase/isfavorite.dart';
import 'firebase_auth_services.dart';
import '../../presentation/usecase/auth/register.dart';
import '../../presentation/usecase/auth/signin.dart';
import '../../presentation/view_model/repository/repo_auth.dart';
import '../../../home/domain/repository/song/song.dart';
import '../../../home/domain/source/song/song_firebase_service.dart';
import '../../../home/presentation/usecase/song/get_news_song.dart';
import '../../../home/presentation/view_model/song/song_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<AuthRepository>(AuthRepoImpl());

  sl.registerSingleton<FirebaseAuthServices>(FirebaseAuthServicesImpl());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<SongRepository>(SongRepositoryImpl());

  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());

  sl.registerSingleton<SignInUSeCase>(SignInUSeCase());
  sl.registerSingleton<GetNewsSong>(GetNewsSong());

  sl.registerSingleton<AddOrRemoveUseCase>(AddOrRemoveUseCase());
  sl.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
}
