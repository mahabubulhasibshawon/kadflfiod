import 'package:bloc/bloc.dart';
import 'package:spotify/domain/entities/songs/song.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';

import '../../../domain/usecases/song/get_play_list.dart';
import '../../../service_locator.dart';
import '../../../domain/entities/songs/song.dart';

part 'play_list_state.dart';


class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold(
          (l) {
        emit(PlayListLoadFailure());
      },
          (data) {
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}

