import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';
import 'package:tmdb_movie/src/feature/movies/domain/use_case/movies_use_cases.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/movie_list_tile.dart';

import '../movies/widgets/movie_list_tile_shimmer.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movieId,
    required this.movie,
  });

  final int movieId;
  final TMDBMovie? movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    buildBody() {
      return [
        MovieListTile(movie: movie!),
        const Gap(16),
        if (movie!.overview != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie!.overview!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
      ];
    }

    if (movie != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(movie!.title),
        ),
        body: Column(
          children: [
            ...buildBody(),
          ],
        ),
      );
    } else {
      final movieAsync = ref.watch(getMovieProvider(movieId: movieId));
      return movieAsync.when(
        error: (e, st) => Scaffold(
          appBar: AppBar(
            title: Text(movie?.title ?? 'Error'),
          ),
          body: Center(child: Text(e.toString())),
        ),
        loading: () => Scaffold(
          appBar: AppBar(
            title: Text(movie?.title ?? 'Loading'),
          ),
          body: const Column(
            children: [
              MovieListTileShimmer(),
            ],
          ),
        ),
        data: (movie) => Scaffold(
          appBar: AppBar(
            title: Text(movie.title),
          ),
          body: Column(
            children: [
              ...buildBody(),
            ],
          ),
        ),
      );
    }
  }
}
