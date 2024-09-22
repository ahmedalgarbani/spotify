import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/cubit/favorite_button_cubit/favoritebutton_cubit.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/features/home/presentation/view_model/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  const FavoriteButton({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritebuttonCubit(),
      child: BlocBuilder<FavoritebuttonCubit, FavoritebuttonState>(
        builder: (context, state) {
          if (state is FavoritebuttonInitial) {
            return IconButton(
                onPressed: () {
                  context
                      .read<FavoritebuttonCubit>()
                      .favoritebuttonUpdate(songEntity.songId);
                },
                icon: Icon(
                    songEntity.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColors.grey));
          } else if (state is FavoritebuttonUpdated) {
            return IconButton(
                onPressed: () {
                   context
                      .read<FavoritebuttonCubit>()
                      .favoritebuttonUpdate(songEntity.songId);
                },
                icon: Icon(
                    state.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColors.grey));
          }
          return Container();
        },
      ),
    );
  }
}
