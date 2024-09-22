import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecasses/usecase.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/home/domain/repository/song/song.dart';
import 'package:spotify/features/home/presentation/view_model/song/song_repository_impl.dart';

class GetNewsSong implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getNewsSongs();
  }
}
