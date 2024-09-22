part of 'newssongs_cubit.dart';

@immutable
sealed class NewssongsState {}

final class NewssongsLoading extends NewssongsState {}

final class NewssongsLoaded extends NewssongsState {
  final List<SongEntity> NewsSongs;

  NewssongsLoaded({required this.NewsSongs});
}

final class NewssongsLoadFailure extends NewssongsState {}
