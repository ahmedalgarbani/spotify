import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/constant/app_url.dart';
import 'package:spotify/core/helpers/isdark.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/features/home/presentation/bloc/get_news_songs_cubit/newssongs_cubit.dart';
import 'package:spotify/features/home/presentation/view_model/entities/song/song.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewssongsCubit()..getNewssongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewssongsCubit, NewssongsState>(
          builder: (context, state) {
            return _conditionCheck(context, state);
          },
        ),
      ),
    );
  }

  Widget _conditionCheck(BuildContext context, NewssongsState state) {
    if (state is NewssongsLoading) {
      return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator());
    }
    if (state is NewssongsLoaded) {
      return _songs(state.NewsSongs);
    } else if (state is NewssongsLoadFailure) {
      return Container();
    }
    return Container();
  }

  Widget _songs(List<SongEntity> newsSongs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 160,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppUrl.app_image)),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 40,
                        height: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, 
                            color: context.isDarkMode ? AppColors.darkGrey:AppColors.lightBackground),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color:context.isDarkMode? Color(0xff959595) : Color(0xff555555),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  newsSongs[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  newsSongs[index].artist,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 14,
          );
        },
        itemCount: newsSongs.length);
  }
}
