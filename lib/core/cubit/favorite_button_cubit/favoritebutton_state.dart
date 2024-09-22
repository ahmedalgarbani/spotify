part of 'favoritebutton_cubit.dart';

@immutable
sealed class FavoritebuttonState {}

final class FavoritebuttonInitial extends FavoritebuttonState {}

final class FavoritebuttonUpdated extends FavoritebuttonState {
  final bool isFavorite;

  FavoritebuttonUpdated({required this.isFavorite});
}
