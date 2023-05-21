import '../../../domain/music/entities/song.dart';
import '../models/song_model.dart';

extension SongModelMapperX on SongModel {
  Song toDomain() {
    return Song(
      kind: kind,
      collectionName: collectionName,
      trackName: trackName,
      artistName: artistName,
      previewUrl: previewUrl,
      releaseDate: releaseDate,
      primaryGenreName: primaryGenreName,
      shortDescription: shortDescription,
      longDescription: longDescription,
      artworkUrl100: artworkUrl100,
      artworkUrl30: artworkUrl30,
      artworkUrl60: artworkUrl60,
      collectionArtistId: collectionArtistId,
      collectionArtistViewUrl: collectionArtistViewUrl,
      collectionCensoredName: collectionCensoredName,
      collectionExplicitness: collectionExplicitness,
      collectionHdPrice: collectionHdPrice,
      collectionId: collectionId,
      collectionPrice: collectionPrice,
      collectionViewUrl: collectionViewUrl,
      contentAdvisoryRating: contentAdvisoryRating,
      country: country,
      currency: currency,
      discCount: discCount,
      discNumber: discNumber,
      hasITunesExtras: hasITunesExtras,
      trackCensoredName: trackCensoredName,
      trackCount: trackCount,
      trackExplicitness: trackExplicitness,
      trackHdPrice: trackHdPrice,
      trackId: trackId,
      trackNumber: trackNumber,
      trackPrice: trackPrice,
      trackTimeMillis: trackTimeMillis,
      trackViewUrl: trackViewUrl,
      wrapperType: wrapperType,
    );
  }
}
