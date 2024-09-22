part of 'playlist_cubit.dart';

@immutable
sealed class PlaylistState {}

final class PlaylistLoading extends PlaylistState {}

final class PlaylistLoaded extends PlaylistState {
  final List<SongEntity> Playlist;

  PlaylistLoaded({required this.Playlist});
}

final class PlaylistLoadFailure extends PlaylistState {}