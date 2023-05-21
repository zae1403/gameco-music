import 'package:dartz/dartz.dart';

import '../../../domain/core/errors/failures.dart';
import '../../../domain/music/entities/song.dart';
import '../../../domain/music/params/filter_music_params.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../core/exceptions.dart';
import '../../core/extensions.dart';
import '../datasources/music_remote_datasource.dart';
import '../mappers/song_model_mapper.dart';

class MusicRepositoryImpl extends IMusicRepository {
  final IMusicRemoteDataSource _remoteDataSource;

  MusicRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Song>>> getSongs(FilterMusicParams params) async {
    try {
      final response = await _remoteDataSource.getSongs(params);
      return Right(response.map((e) => e.toDomain()).toList());
    } on ServerException catch (e) {
      return Left(e.toFailure());
    }
  }
}
