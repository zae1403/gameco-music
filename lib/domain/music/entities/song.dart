import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

@freezed
class Song with _$Song {
  const factory Song({
    required String wrapperType,
    required String kind,
    required int? collectionId,
    required int? trackId,
    required String artistName,
    required String collectionName,
    required String trackName,
    required String collectionCensoredName,
    required String trackCensoredName,
    required int? collectionArtistId,
    required String? collectionArtistViewUrl,
    required String? collectionViewUrl,
    required String? trackViewUrl,
    required String? previewUrl,
    required String? artworkUrl30,
    required String? artworkUrl60,
    required String? artworkUrl100,
    required double? collectionPrice,
    required double? trackPrice,
    required double? collectionHdPrice,
    required double? trackHdPrice,
    required DateTime? releaseDate,
    required String collectionExplicitness,
    required String trackExplicitness,
    required int? discCount,
    required int? discNumber,
    required int? trackCount,
    required int? trackNumber,
    required int? trackTimeMillis,
    required String? country,
    required String? currency,
    required String? primaryGenreName,
    required String? contentAdvisoryRating,
    required String? shortDescription,
    required String? longDescription,
    required bool? hasITunesExtras,
  }) = _Song;
}
