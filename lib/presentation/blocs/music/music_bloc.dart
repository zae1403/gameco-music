import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/errors/failures.dart';
import '../../../domain/music/entities/song.dart';
import '../../../domain/music/params/filter_music_params.dart';
import '../../../domain/music/usecases/get_songs.dart';
import '../core/debounce.dart';

part 'music_event.dart';
part 'music_state.dart';
part 'music_bloc.freezed.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final GetSongs _getSongs;
  MusicBloc(this._getSongs) : super(MusicState.initial()) {
    on<_MusicSongFetched>(_onSongFetched,
        transformer: debounce(const Duration(milliseconds: 500)));
  }

  Future<void> _onSongFetched(
    _MusicSongFetched event,
    Emitter<MusicState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      responseFailureOrSuccess: none(),
    ));

    final response =
        await _getSongs(FilterMusicParams(search: event.query ?? 'coldplay'));

    emit(state.copyWith(
      isLoading: false,
      query: event.query,
      responseFailureOrSuccess: some(response),
    ));
  }
}
