part of 'music_bloc.dart';

@freezed
class MusicState with _$MusicState {
  const factory MusicState({
    required bool isLoading,
    required String? query,
    required Option<Either<Failure, List<Song>>> responseFailureOrSuccess,
  }) = _MusicState;

  factory MusicState.initial() => const MusicState(
        isLoading: false,
        query: null,
        responseFailureOrSuccess: None(),
      );
}
