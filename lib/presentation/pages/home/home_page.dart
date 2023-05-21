import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/music/music_bloc.dart';
import '../../widgets/error_view.dart';
import '../../widgets/hide_focus.dart';
import 'widgets/song_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HideFocus(
      child: Scaffold(
        appBar: AppBar(title: const Text('Gameco Music')),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: _SearchBar(),
            ),
            Expanded(
              child: BlocConsumer<MusicBloc, MusicState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  return state.responseFailureOrSuccess.fold(
                    () => const SizedBox.shrink(),
                    (either) => either.fold(
                      (failure) => ErrorView(
                        child: Text(failure.message),
                        onRefresh: () {
                          context
                              .read<MusicBloc>()
                              .add(MusicEvent.songFetched(query: state.query));
                        },
                      ),
                      (songs) {
                        if (songs.isEmpty) {
                          return const ErrorView(
                            child:
                                Text('No results found.\nTry another keyword.'),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async => context
                              .read<MusicBloc>()
                              .add(const MusicEvent.songFetched()),
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(height: 0),
                            itemCount: songs.length,
                            itemBuilder: (context, index) {
                              final item = songs[index];
                              return SongCard(item: item);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar();

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      onChanged: (value) {
        if (value.length > 2) {
          context.read<MusicBloc>().add(MusicEvent.songFetched(query: value));
        }
      },
      trailing: [
        ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, value, _) {
            return Visibility(
              visible: value.text.isNotEmpty,
              child: IconButton(
                onPressed: () => _controller.clear(),
                icon: const Icon(
                  Icons.close,
                  size: 18,
                ),
              ),
            );
          },
        ),
      ],
      leading: const Icon(Icons.search),
      elevation: const MaterialStatePropertyAll(0),
      side: MaterialStatePropertyAll(BorderSide(
        color: Theme.of(context).colorScheme.outlineVariant,
      )),
      hintText: 'Search for a song or artist...',
    );
  }
}
