import 'package:flutter/material.dart';

import '../../../../domain/music/entities/song.dart';

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
      // selected: state.video == item,
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
      // leading: const Icon(Icons.play_circle_fill_rounded),
      title: Text(item.trackName),
      subtitle: Text(item.artistName),
      trailing: Text(timeFormatter(item.trackTimeMillis)),
      // onTap: state.video != item
      //     ? () {
      //         Scrollable.ensureVisible(context,
      //             duration: const Duration(milliseconds: 500));

      //         state.controller?.pause();
      //         context
      //             .read<VideoPlayerBloc>()
      //             .add(VideoPlayerEvent.played(item));
      //       }
      //     : null,
    );
  }
}
