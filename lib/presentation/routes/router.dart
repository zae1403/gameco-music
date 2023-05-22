import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/audio_player/audio_player_page.dart';
import '../pages/home/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage(), routes: [
      GoRoute(
        path: 'audio-player',
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: AudioPlayerPage(),
        ),
      )
    ]),
  ],
);
