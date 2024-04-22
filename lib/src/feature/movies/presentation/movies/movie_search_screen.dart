import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movies/provider/movie_search_provider.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/movie_list_tile.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/movie_search_bar.dart';

class MovieSearchScreen extends ConsumerWidget {
  const MovieSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(movieSearchNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TMDB Movies',
        ),
      ),
      body: Column(
        children: [
          const MovieSearchBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                key: ValueKey(query),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MovieListTile(
                    movie: TMDBMovie(id: index, title: 'title'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
