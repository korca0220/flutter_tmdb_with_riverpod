import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/movie_list_tile.dart';

class MovieDetailScreen extends ConsumerWidget {
  const MovieDetailScreen({
    super.key,
    required this.movieId,
    required this.movie,
  });

  final int movieId;
  final TMDBMovie? movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (movie != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            movie!.title,
          ),
        ),
        body: Column(
          children: [
            MovieListTile(
              movie: movie!,
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('movie.title'),
        ),
        body: Column(
          children: [
            MovieListTile(movie: TMDBMovie(id: -1, title: 'title')),
          ],
        ),
      );
    }
  }
}
