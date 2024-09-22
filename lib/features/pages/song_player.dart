import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/core/widgets/appbar.dart';
import 'package:spotify/features/pages/song_player/songplayer_cubit.dart';

class SongPlayer extends StatelessWidget {
  final dynamic songEntity;
  const SongPlayer({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
        title: const Text(
          "Now playing",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongplayerCubit()..loadSong("url"),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            child: Column(
              children: [
                _songCover(context),
                const SizedBox(
                  height: 10,
                ),
                _songDetails(),
                const SizedBox(
                  height: 10,
                ),
                _songAction(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _songAction(BuildContext context) {
    return BlocBuilder<SongplayerCubit, SongplayerState>(
        builder: (context, state) {
      if (state is SongplayerLoading) {
        return const CircularProgressIndicator();
      } else if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
              value: context
                  .read<SongplayerCubit>()
                  .songPosition
                  .inSeconds
                  .toDouble(),
              onChanged: (value) {},
              min: 0.0,
              max: context
                  .read<SongplayerCubit>()
                  .songDuration
                  .inSeconds
                  .toDouble(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${formatDuration(context.read<SongplayerCubit>().songPosition)}"),
                GestureDetector(
                  onTap: () {
                    context.read<SongplayerCubit>().playOrPauseSong();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primary),
                    child: Icon(
                        context.read<SongplayerCubit>().audioPlayer.playing
                            ? Icons.pause
                            : Icons.play_arrow),
                  ),
                ),
                Text(
                    "${formatDuration(context.read<SongplayerCubit>().songDuration)}"),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        );
      } else {
        return Container();
      }
    });
  }

  dynamic formatDuration(Duration duration) {
    final minute = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minute.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://parade.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_1400/MTk2NTUyMTU0NDE5MzA4MzUw/billie-eilish-net-worth.webp"))),
    );
  }

  Widget _songDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title.toString()??"",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              songEntity.artist,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_rounded,
            size: 35,
            color: AppColors.darkGrey,
          ),
        )
      ],
    );
  }
}
