// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MusicEvent {
  String? get query => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query) songFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? query)? songFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query)? songFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MusicSongFetched value) songFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MusicSongFetched value)? songFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MusicSongFetched value)? songFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MusicEventCopyWith<MusicEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicEventCopyWith<$Res> {
  factory $MusicEventCopyWith(
          MusicEvent value, $Res Function(MusicEvent) then) =
      _$MusicEventCopyWithImpl<$Res, MusicEvent>;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class _$MusicEventCopyWithImpl<$Res, $Val extends MusicEvent>
    implements $MusicEventCopyWith<$Res> {
  _$MusicEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MusicSongFetchedCopyWith<$Res>
    implements $MusicEventCopyWith<$Res> {
  factory _$$_MusicSongFetchedCopyWith(
          _$_MusicSongFetched value, $Res Function(_$_MusicSongFetched) then) =
      __$$_MusicSongFetchedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$$_MusicSongFetchedCopyWithImpl<$Res>
    extends _$MusicEventCopyWithImpl<$Res, _$_MusicSongFetched>
    implements _$$_MusicSongFetchedCopyWith<$Res> {
  __$$_MusicSongFetchedCopyWithImpl(
      _$_MusicSongFetched _value, $Res Function(_$_MusicSongFetched) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_$_MusicSongFetched(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MusicSongFetched implements _MusicSongFetched {
  const _$_MusicSongFetched({this.query});

  @override
  final String? query;

  @override
  String toString() {
    return 'MusicEvent.songFetched(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicSongFetched &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MusicSongFetchedCopyWith<_$_MusicSongFetched> get copyWith =>
      __$$_MusicSongFetchedCopyWithImpl<_$_MusicSongFetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query) songFetched,
  }) {
    return songFetched(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? query)? songFetched,
  }) {
    return songFetched?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query)? songFetched,
    required TResult orElse(),
  }) {
    if (songFetched != null) {
      return songFetched(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MusicSongFetched value) songFetched,
  }) {
    return songFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MusicSongFetched value)? songFetched,
  }) {
    return songFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MusicSongFetched value)? songFetched,
    required TResult orElse(),
  }) {
    if (songFetched != null) {
      return songFetched(this);
    }
    return orElse();
  }
}

abstract class _MusicSongFetched implements MusicEvent {
  const factory _MusicSongFetched({final String? query}) = _$_MusicSongFetched;

  @override
  String? get query;
  @override
  @JsonKey(ignore: true)
  _$$_MusicSongFetchedCopyWith<_$_MusicSongFetched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MusicState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  Option<Either<Failure, List<Song>>> get responseFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MusicStateCopyWith<MusicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicStateCopyWith<$Res> {
  factory $MusicStateCopyWith(
          MusicState value, $Res Function(MusicState) then) =
      _$MusicStateCopyWithImpl<$Res, MusicState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? query,
      Option<Either<Failure, List<Song>>> responseFailureOrSuccess});
}

/// @nodoc
class _$MusicStateCopyWithImpl<$Res, $Val extends MusicState>
    implements $MusicStateCopyWith<$Res> {
  _$MusicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? query = freezed,
    Object? responseFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      responseFailureOrSuccess: null == responseFailureOrSuccess
          ? _value.responseFailureOrSuccess
          : responseFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Song>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MusicStateCopyWith<$Res>
    implements $MusicStateCopyWith<$Res> {
  factory _$$_MusicStateCopyWith(
          _$_MusicState value, $Res Function(_$_MusicState) then) =
      __$$_MusicStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? query,
      Option<Either<Failure, List<Song>>> responseFailureOrSuccess});
}

/// @nodoc
class __$$_MusicStateCopyWithImpl<$Res>
    extends _$MusicStateCopyWithImpl<$Res, _$_MusicState>
    implements _$$_MusicStateCopyWith<$Res> {
  __$$_MusicStateCopyWithImpl(
      _$_MusicState _value, $Res Function(_$_MusicState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? query = freezed,
    Object? responseFailureOrSuccess = null,
  }) {
    return _then(_$_MusicState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      responseFailureOrSuccess: null == responseFailureOrSuccess
          ? _value.responseFailureOrSuccess
          : responseFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Song>>>,
    ));
  }
}

/// @nodoc

class _$_MusicState implements _MusicState {
  const _$_MusicState(
      {required this.isLoading,
      required this.query,
      required this.responseFailureOrSuccess});

  @override
  final bool isLoading;
  @override
  final String? query;
  @override
  final Option<Either<Failure, List<Song>>> responseFailureOrSuccess;

  @override
  String toString() {
    return 'MusicState(isLoading: $isLoading, query: $query, responseFailureOrSuccess: $responseFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(
                    other.responseFailureOrSuccess, responseFailureOrSuccess) ||
                other.responseFailureOrSuccess == responseFailureOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, query, responseFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MusicStateCopyWith<_$_MusicState> get copyWith =>
      __$$_MusicStateCopyWithImpl<_$_MusicState>(this, _$identity);
}

abstract class _MusicState implements MusicState {
  const factory _MusicState(
      {required final bool isLoading,
      required final String? query,
      required final Option<Either<Failure, List<Song>>>
          responseFailureOrSuccess}) = _$_MusicState;

  @override
  bool get isLoading;
  @override
  String? get query;
  @override
  Option<Either<Failure, List<Song>>> get responseFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_MusicStateCopyWith<_$_MusicState> get copyWith =>
      throw _privateConstructorUsedError;
}
