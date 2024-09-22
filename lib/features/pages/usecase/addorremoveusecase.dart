import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecasses/usecase.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/home/domain/repository/song/song.dart';

class AddOrRemoveUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<SongRepository>().addOrRemoveFavoriteSongs(params!);
  }
}