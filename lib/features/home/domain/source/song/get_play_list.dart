import 'package:dartz/dartz.dart';
import '../../../../../core/usecasses/usecase.dart';
import '../../../../authentiaction/data/services/service_locator.dart';
import '../../repository/song/song.dart';

class GetPlayListUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getPlayList();
  }
}
