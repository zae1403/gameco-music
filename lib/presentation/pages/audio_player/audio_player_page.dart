import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../services/audio_handler.dart';
import '../../widgets/audio_video_progressbar.dart';
import '../../widgets/dialogs.dart';
import 'widgets/control_buttons.dart';

class AudioPlayerPage extends StatelessWidget {
  const AudioPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 3, child: SongView()),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 32),
                child: Column(
                  children: [
                    // A seek bar.
                    const _SeekBar(),
                    const SizedBox(height: 8),
                    // Playback controls
                    ControlButtons(audioHandler),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongView extends StatelessWidget {
  const SongView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MediaItem?>(
      stream: audioHandler.mediaItem,
      builder: (context, snapshot) {
        final mediaItem = snapshot.data;
        if (mediaItem == null) return const SizedBox();
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (mediaItem.artUri != null)
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      '${mediaItem.artUri!}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              Text(mediaItem.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600)),
              Text(mediaItem.artist ?? 'unknown'),
            ],
          ),
        );
      },
    );
  }
}

class _SeekBar extends StatelessWidget {
  const _SeekBar();

  Stream<Duration> get _bufferedPositionStream => audioHandler.playbackState
      .map((state) => state.bufferedPosition)
      .distinct();
  Stream<Duration?> get _durationStream =>
      audioHandler.mediaItem.map((item) => item?.duration);
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          AudioService.position,
          _bufferedPositionStream,
          _durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data ??
            PositionData(Duration.zero, Duration.zero, Duration.zero);
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ProgressBar(
            thumbRadius: 8,
            thumbGlowRadius: 18,
            timeLabelPadding: 4,
            timeLabelTextStyle:
                const TextStyle(fontSize: 12, color: Colors.black),
            total: positionData.duration,
            progress: positionData.position,
            onSeek: (newPosition) {
              audioHandler.seek(newPosition);
            },
            buffered: positionData.bufferedPosition,
          ),
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StreamBuilder<double>(
                        stream: audioHandler.speed,
                        builder: (context, snapshot) => ListTile(
                          leading: Text(
                            '${snapshot.data?.toStringAsFixed(1)}x',
                          ),
                          title: const Text('Adjust Speed'),
                          onTap: () {
                            Navigator.pop(context);
                            showSliderDialog(
                              context: context,
                              title: 'Adjust speed',
                              divisions: 10,
                              min: 0.5,
                              max: 1.5,
                              value: audioHandler.speed.value,
                              stream: audioHandler.speed,
                              onChanged: audioHandler.setSpeed,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.volume_up),
                        title: const Text('Adjust Volume'),
                        onTap: () {
                          Navigator.pop(context);
                          showSliderDialog(
                            context: context,
                            title: 'Adjust volume',
                            divisions: 10,
                            min: 0.0,
                            max: 1.0,
                            value: audioHandler.volume.value,
                            stream: audioHandler.volume,
                            onChanged: audioHandler.setVolume,
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.more_vert_rounded),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
