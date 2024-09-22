import 'package:dartz/dartz.dart';
import '../../../../authentiaction/data/services/service_locator.dart';
import '../../../domain/repository/song/song.dart';
import '../../../domain/source/song/song_firebase_service.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }
  
  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId)async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSongs(songId);
  }
  
  @override
  Future<bool> isFavoriteSong(String songId)async {
       return await sl<SongFirebaseService>().isFavoriteSong(songId);

  }
}
