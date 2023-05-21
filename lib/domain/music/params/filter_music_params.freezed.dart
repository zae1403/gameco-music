// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_music_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterMusicParams {
  @JsonKey(name: 'term', includeIfNull: false)
  String? get search => throw _privateConstructorUsedError;
  String get media => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterMusicParamsCopyWith<FilterMusicParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterMusicParamsCopyWith<$Res> {
  factory $FilterMusicParamsCopyWith(
          FilterMusicParams value, $Res Function(FilterMusicParams) then) =
      _$FilterMusicParamsCopyWithImpl<$Res, FilterMusicParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'term', includeIfNull: false) String? search,
      String media,
      int limit});
}

/// @nodoc
class _$FilterMusicParamsCopyWithImpl<$Res, $Val extends FilterMusicParams>
    implements $FilterMusicParamsCopyWith<$Res> {
  _$FilterMusicParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? media = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterMusicParamsCopyWith<$Res>
    implements $FilterMusicParamsCopyWith<$Res> {
  factory _$$_FilterMusicParamsCopyWith(_$_FilterMusicParams value,
          $Res Function(_$_FilterMusicParams) then) =
      __$$_FilterMusicParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'term', includeIfNull: false) String? search,
      String media,
      int limit});
}

/// @nodoc
class __$$_FilterMusicParamsCopyWithImpl<$Res>
    extends _$FilterMusicParamsCopyWithImpl<$Res, _$_FilterMusicParams>
    implements _$$_FilterMusicParamsCopyWith<$Res> {
  __$$_FilterMusicParamsCopyWithImpl(
      _$_FilterMusicParams _value, $Res Function(_$_FilterMusicParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? media = null,
    Object? limit = null,
  }) {
    return _then(_$_FilterMusicParams(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(createFactory: false)
class _$_FilterMusicParams implements _FilterMusicParams {
  const _$_FilterMusicParams(
      {@JsonKey(name: 'term', includeIfNull: false) this.search,
      this.media = 'music',
      this.limit = 20});

  @override
  @JsonKey(name: 'term', includeIfNull: false)
  final String? search;
  @override
  @JsonKey()
  final String media;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'FilterMusicParams(search: $search, media: $media, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterMusicParams &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, search, media, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterMusicParamsCopyWith<_$_FilterMusicParams> get copyWith =>
      __$$_FilterMusicParamsCopyWithImpl<_$_FilterMusicParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterMusicParamsToJson(
      this,
    );
  }
}

abstract class _FilterMusicParams implements FilterMusicParams {
  const factory _FilterMusicParams(
      {@JsonKey(name: 'term', includeIfNull: false) final String? search,
      final String media,
      final int limit}) = _$_FilterMusicParams;

  @override
  @JsonKey(name: 'term', includeIfNull: false)
  String? get search;
  @override
  String get media;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$_FilterMusicParamsCopyWith<_$_FilterMusicParams> get copyWith =>
      throw _privateConstructorUsedError;
}
