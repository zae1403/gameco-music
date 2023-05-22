import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/core/dio_client.dart';
import 'data/music/datasources/music_remote_datasource.dart';
import 'data/music/repositories/music_repository.dart';
import 'domain/music/repositories/i_music_repository.dart';
import 'domain/music/usecases/get_songs.dart';
import 'presentation/blocs/music/music_bloc.dart';
import 'presentation/services/audio_handler.dart';

final sl = GetIt.instance;

Future<void> initServices() async {
  await _initExternalDependencies();
  _initVideoFeatures();
}

Future<void> _initExternalDependencies() async {
  ///Http Client with Dio
  sl.registerLazySingleton<Dio>(() => DioClient.instance);

  ///Audio Handler
  sl.registerSingleton<AudioPlayerHandler>(await initAudioService());
}

void _initVideoFeatures() {
  /// Data Source
  sl.registerLazySingleton<IMusicRemoteDataSource>(
    () => MusicRemoteDataSourceImpl(sl()),
  );

  /// Repository
  sl.registerLazySingleton<IMusicRepository>(
    () => MusicRepositoryImpl(sl()),
  );

  /// Use Cases
  sl.registerLazySingleton(() => GetSongs(sl()));

  /// State Management
  sl.registerFactory(() => MusicBloc(sl()));
}
