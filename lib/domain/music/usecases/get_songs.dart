import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/usecase.dart';
import '../entities/song.dart';
import '../params/filter_music_params.dart';
import '../repositories/i_music_repository.dart';

class GetSongs implements UseCase<List<Song>, FilterMusicParams> {
  final IMusicRepository _repository;

  const GetSongs(this._repository);

  @override
  Future<Either<Failure, List<Song>>> call(FilterMusicParams params) =>
      _repository.getSongs(params);
}
