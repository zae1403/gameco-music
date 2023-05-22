
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import '../../../services/audio_handler.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayerHandler audioHandler;

  const ControlButtons(this.audioHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<AudioServiceRepeatMode>(
          stream: audioHandler.playbackState
              .map((state) => state.repeatMode)
              .distinct(),
          builder: (context, snapshot) {
            final repeatMode = snapshot.data ?? AudioServiceRepeatMode.none;
            const icons = [
              Icon(Icons.repeat, color: Colors.grey),
              Icon(Icons.repeat, color: Colors.orange),
              Icon(Icons.repeat_one, color: Colors.orange),
            ];
            const cycleModes = [
              AudioServiceRepeatMode.none,
              AudioServiceRepeatMode.all,
              AudioServiceRepeatMode.one,
            ];
            final index = cycleModes.indexOf(repeatMode);
            return IconButton(
              icon: icons[index],
              onPressed: () {
                audioHandler.setRepeatMode(cycleModes[
                    (cycleModes.indexOf(repeatMode) + 1) % cycleModes.length]);
              },
            );
          },
        ),
        StreamBuilder<QueueState>(
          stream: audioHandler.queueState,
          builder: (context, snapshot) {
            final queueState = snapshot.data ?? QueueState.empty;
            return IconButton(
              icon: const Icon(
                Icons.skip_previous,
                size: 40,
              ),
              onPressed:
                  queueState.hasPrevious ? audioHandler.skipToPrevious : null,
            );
          },
        ),
        StreamBuilder<PlaybackState>(
          stream: audioHandler.playbackState,
          builder: (context, snapshot) {
            final playbackState = snapshot.data;
            final processingState = playbackState?.processingState;
            final playing = playbackState?.playing;
            if (processingState == AudioProcessingState.loading ||
                processingState == AudioProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const FractionallySizedBox(
                  heightFactor: .8,
                  widthFactor: .8,
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: audioHandler.play,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 64.0,
                onPressed: audioHandler.pause,
              );
            }
          },
        ),
        StreamBuilder<QueueState>(
          stream: audioHandler.queueState,
          builder: (context, snapshot) {
            final queueState = snapshot.data ?? QueueState.empty;
            return IconButton(
              icon: const Icon(
                Icons.skip_next,
                size: 40,
              ),
              onPressed: queueState.hasNext ? audioHandler.skipToNext : null,
            );
          },
        ),
        StreamBuilder<bool>(
          stream: audioHandler.playbackState
              .map((state) => state.shuffleMode == AudioServiceShuffleMode.all)
              .distinct(),
          builder: (context, snapshot) {
            final shuffleModeEnabled = snapshot.data ?? false;
            return IconButton(
              icon: shuffleModeEnabled
                  ? const Icon(Icons.shuffle, color: Colors.orange)
                  : const Icon(Icons.shuffle, color: Colors.grey),
              onPressed: () async {
                final enable = !shuffleModeEnabled;
                await audioHandler.setShuffleMode(enable
                    ? AudioServiceShuffleMode.all
                    : AudioServiceShuffleMode.none);
              },
            );
          },
        ),
      ],
    );
  }
}
