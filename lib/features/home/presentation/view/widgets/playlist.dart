import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/router/app_router.dart';
import 'package:spotify/core/widgets/favorite_button.dart';
import '../../../../../core/helpers/isdark.dart';
import '../../../../../core/theme/app_color.dart';
import '../../bloc/playlist_cubit/playlist_cubit.dart';
import '../../view_model/entities/song/song.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getplaylist(),
      child:
          BlocBuilder<PlaylistCubit, PlaylistState>(builder: (context, state) {
        return _conditionCheck(context, state);
      }),
    );
  }

  Widget _conditionCheck(BuildContext context, PlaylistState state) {
    if (state is PlaylistLoading) {
      return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator());
    }
    if (state is PlaylistLoaded) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Playlist',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                Text(
                  'More',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _songs(state.Playlist),
          ],
        ),
      );
    } else if (state is PlaylistLoadFailure) {
      return Container();
    }
    return Container();
  }

  Widget _songs(List<SongEntity> playlist) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoute.KSongPlayer);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? Color(0xff959595)
                            : Color(0xff555555),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode
                              ? AppColors.darkGrey
                              : const Color(0xffE6E6E6)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          playlist[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          playlist[index].artist,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        playlist[index]
                            .duration
                            .toString()
                            .replaceAll('.', ':'),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 20,
                    ),
                    FavoriteButton(songEntity: playlist[index],)
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: playlist.length);
  }
}
