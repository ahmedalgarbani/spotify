import 'package:dartz/dartz.dart';
import '../../../../../core/usecasses/usecase.dart';
import '../../../../authentiaction/data/services/service_locator.dart';
import '../../../domain/repository/song/song.dart';
import '../../view_model/song/song_repository_impl.dart';

class GetNewsSong implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getNewsSongs();
  }
}
