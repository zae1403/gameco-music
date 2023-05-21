import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/song.dart';
import '../params/filter_music_params.dart';

abstract class IMusicRepository {
  Future<Either<Failure, List<Song>>> getSongs(FilterMusicParams params);
}
