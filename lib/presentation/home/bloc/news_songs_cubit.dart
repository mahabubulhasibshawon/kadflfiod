 import 'package:bloc/bloc.dart';
import 'package:spotify/domain/entities/songs/song.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';

import '../../../service_locator.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
        (l) {
          emit(NewsSongsLoadFailure());
        },
        (data) {
          emit(NewsSongsLoaded(songs: data));
        },
    );
  }
}
