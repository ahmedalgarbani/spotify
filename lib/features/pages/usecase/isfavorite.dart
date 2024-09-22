import 'package:spotify/core/usecasses/usecase.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/home/domain/repository/song/song.dart';

class IsFavoriteUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String ? params}) async {
    return await sl<SongRepository>().isFavoriteSong(params!);
  }
}