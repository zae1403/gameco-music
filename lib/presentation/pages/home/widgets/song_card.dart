import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/music/entities/song.dart';
import '../../../services/audio_handler.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.item,
  });

  final Song item;

  String timeFormatter(int? timeInMillis) {
    if (timeInMillis == null) return '--:--';

    int seconds = (timeInMillis / 1000).floor();
    final int minutes = (seconds / 60).floor();
    seconds = (seconds % 60);

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 56,
        width: 56,
        child: Image.network(
          item.artworkUrl100 ?? '',
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              frame == null
                  ? const FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                  : child,
        ),
      ),
      title: Text(item.trackName),
      subtitle: Text(item.artistName),
      trailing: Text(timeFormatter(item.trackTimeMillis)),
      onTap: () {
        Scrollable.ensureVisible(context,
            duration: const Duration(milliseconds: 500));

        final mediaItem = MediaItem(
          id: item.previewUrl ?? '',
          title: item.trackName,
          album: item.collectionName,
          artist: item.artistName,
          duration: Duration(milliseconds: item.trackTimeMillis ?? 0),
          artUri: item.artworkUrl100 != null
              ? Uri.parse(item.artworkUrl100!)
              : null,
        );
        audioHandler.updateQueue([mediaItem]);
        audioHandler.play();
        context.go('/audio-player');
      },
    );
  }
}
