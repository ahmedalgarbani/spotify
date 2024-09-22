part of 'songplayer_cubit.dart';

@immutable
sealed class SongplayerState {}

final class SongplayerLoading extends SongplayerState {}
final class SongPlayerLoaded extends SongplayerState {}
final class SongPlayerLoadFailure extends SongplayerState {}
