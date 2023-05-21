import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_music_params.freezed.dart';
part 'filter_music_params.g.dart';

@Freezed(toJson: true, fromJson: false)
class FilterMusicParams with _$FilterMusicParams {
  @JsonSerializable(createFactory: false)
  const factory FilterMusicParams({
    @JsonKey(name: 'term',includeIfNull: false) String? search,
    @Default('music') String media,
    @Default(20) int limit,
  }) = _FilterMusicParams;
}
