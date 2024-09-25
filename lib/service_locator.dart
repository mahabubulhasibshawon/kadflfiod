import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';

import 'data/repository/song/song_repository_impl.dart';
import 'data/sources/song/song_firebase_service.dart';
import 'domain/repository/song/song.dart';
import 'domain/usecases/auth/signin.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
  sl.registerSingleton<SongFirebaseService>(
    SongfirebaseServiceImpl()
  );
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );
  sl.registerSingleton<SongsRepository>(
      SongRepositoryImpl()
  );
  sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );
  sl.registerSingleton<SigninUseCase>(
      SigninUseCase()
  );
  sl.registerSingleton<GetNewsSongsUseCase>(
      GetNewsSongsUseCase()
  );
}