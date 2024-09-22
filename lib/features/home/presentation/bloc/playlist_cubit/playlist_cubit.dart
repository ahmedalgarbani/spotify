import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/home/presentation/usecase/song/get_news_song.dart';
import 'package:spotify/features/home/presentation/view_model/entities/song/song.dart';

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
