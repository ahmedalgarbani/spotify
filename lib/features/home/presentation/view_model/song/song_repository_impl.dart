import 'package:dartz/dartz.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/home/domain/repository/song/song.dart';
import 'package:spotify/features/home/domain/source/song/song.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}
