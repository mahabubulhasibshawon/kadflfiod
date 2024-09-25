import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entities/songs/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
              if (state is NewsSongsLoading) {
                return CircularProgressIndicator();
              }
              if (state is NewsSongsLoaded) {
                return _songs(state.songs);
              }
              return Container();
            },
          )),
    );
  }
}

Widget _songs(List<SongEnity> songs) {
  return ListView.separated(
      itemBuilder: (context, index) {
        return Column();
      },
      separatorBuilder: (context, index) => SizedBox(
            width: 14,
          ),
      itemCount: songs.length);
}
