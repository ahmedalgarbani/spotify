import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/home/presentation/usecase/song/get_news_song.dart';
import 'package:spotify/features/home/presentation/view_model/entities/song/song.dart';

part 'newssongs_state.dart';

class NewssongsCubit extends Cubit<NewssongsState> {
  NewssongsCubit() : super(NewssongsLoading());

  Future<void> getNewssongs() async {
    var newssongs = await sl<GetNewsSong>().call();
    newssongs.fold((l) {
      emit(NewssongsLoadFailure());
    }, (data) {
      emit(NewssongsLoaded(NewsSongs: data));
    });
  }
}
