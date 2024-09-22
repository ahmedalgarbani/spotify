import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../authentiaction/data/services/service_locator.dart';
import '../../usecase/song/get_news_song.dart';
import '../../view_model/entities/song/song.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

   Future<void> getplaylist() async {
    var playlist = await sl<GetNewsSong>().call();
    playlist.fold((l) {
      emit(PlaylistLoadFailure());
    }, (data) {
      emit(PlaylistLoaded(Playlist: data));
    });
  }
}
