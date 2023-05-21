part of 'music_bloc.dart';

@freezed
class MusicEvent with _$MusicEvent {
  const factory MusicEvent.songFetched({String? query}) = _MusicSongFetched;
}
