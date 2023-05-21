// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_music_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$_FilterMusicParamsToJson(
    _$_FilterMusicParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('term', instance.search);
  val['media'] = instance.media;
  val['limit'] = instance.limit;
  return val;
}
